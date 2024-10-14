import { isNil } from 'lodash'
import { ShoppingList } from '../models/shopping_list'
import { UserShoppingList } from '../models/user_shopping_list'
import { BatchRepository } from '../repositories/batch_repository'
import { ShoppingListRepository } from '../repositories/shopping_list_repository'
import { UserProfileRepository } from '../repositories/user_profile_repository'
import { UserShoppingListRepository } from '../repositories/user_shopping_list_repository'

export class ShoppingListService {
  constructor(
    private batchRepository: BatchRepository,
    private userProfileRepository: UserProfileRepository,
    private shoppingListRepository: ShoppingListRepository,
    private userShoppingListRepository: UserShoppingListRepository
  ) {}

  /**
   * Creates a user shopping list if it does not already exist.
   *
   * @param userId - The ID of the user.
   * @param shoppingListId - The ID of the shopping list.
   * @returns A promise that resolves when the operation is complete.
   *
   * @remarks
   * - If the user shopping list already exists, a log message is printed and the function returns early.
   * - If the shopping list is not found, an error message is printed and the function returns early.
   * - The new shopping list is created with an order index that is one greater than the current maximum order index for the user.
   */
  async createUserShoppingList(userId: string, shoppingListId: string): Promise<void> {
    const isAlreadyExists = await this.userShoppingListRepository.isExists(userId, shoppingListId)
    if (isAlreadyExists) {
      // TODO(Ukkey): Implement custom logger
      console.log(`User shopping list already exists: ${userId}, ${shoppingListId}`)
      return
    }

    const shoppingList = await this.shoppingListRepository.fetch(shoppingListId)
    if (!shoppingList) {
      // TODO(Ukkey): Implement custom logger
      console.error(`Shopping list not found: ${shoppingListId}`)
      return
    }

    const newUserShoppingList = await this.generateNewUserShoppingListFromShoppingList(
      userId,
      shoppingList
    )
    await this.userShoppingListRepository.create(userId, newUserShoppingList)
  }

  /**
   * Synchronizes all users' shopping lists with the specified shopping list.
   *
   * This function fetches the shopping list by its ID and updates or deletes
   * user shopping lists based on whether the owner has changed. If the owner
   * has changed, it ensures the new owner exists and creates a new user shopping
   * list for the new owner.
   *
   * @param shoppingListId - The ID of the shopping list to synchronize.
   * @param beforeOwnerUserId - The user ID of the previous owner of the shopping list.
   * @returns A promise that resolves when the synchronization is complete.
   */
  async syncAllUsersShoppingLists(
    shoppingListId: string,
    beforeOwnerUserId: string
  ): Promise<void> {
    const shoppingList = await this.shoppingListRepository.fetch(shoppingListId)
    if (!shoppingList) {
      // TODO(Ukkey): Implement custom logger
      console.error(`Shopping list not found: ${shoppingListId}`)
      return
    }

    const hasOwnerUserChanged = shoppingList.ownerUserId !== beforeOwnerUserId
    if (hasOwnerUserChanged) {
      // TODO(Ukkey): Implement custom logger
      console.log(`Owner user changed: ${beforeOwnerUserId} -> ${shoppingList.ownerUserId}`)
    }

    const userIds =
      await this.userShoppingListRepository.listUserIdsByShoppingListId(shoppingListId)

    this.batchRepository.runBatch(async batch => {
      for (const userId of userIds) {
        if (hasOwnerUserChanged && userId === beforeOwnerUserId) {
          // TODO(Ukkey): Implement custom logger
          console.log(`Old user shopping list deleted: ${userId}, ${shoppingListId}`)
          // If the owner has changed and the user is the previous owner, the user shopping list is deleted
          this.userShoppingListRepository.deleteWithBatch(batch, userId, shoppingListId)
        } else {
          // TODO(Ukkey): Implement custom logger
          console.log(`User shopping list updated: ${userId}, ${shoppingListId}`)
          // If the owner has not changed or the user is not the previous owner, the user shopping list is updated
          this.userShoppingListRepository.updateWithBatch(batch, userId, shoppingListId, {
            name: shoppingList.name,
            ownerUserId: shoppingList.ownerUserId,
          })
        }
      }

      // If the owner has changed and the new owner exists, a new user shopping list is created
      // for the new owner
      if (hasOwnerUserChanged) {
        const isExistsAfterOwner = await this.userProfileRepository.isExists(
          shoppingList.ownerUserId
        )
        if (!isExistsAfterOwner) {
          // TODO(Ukkey): Implement custom logger
          console.error(`New owner user profile not found: ${shoppingList.ownerUserId}`)
          return
        }

        const newUserShoppingList = await this.generateNewUserShoppingListFromShoppingList(
          shoppingList.ownerUserId,
          shoppingList
        )
        // TODO(Ukkey): Implement custom logger
        console.log(
          `New user shopping list created: ${shoppingList.ownerUserId}, ${shoppingListId}`
        )
        this.userShoppingListRepository.createWithBatch(
          batch,
          shoppingList.ownerUserId,
          newUserShoppingList
        )
      }
    })
  }

  /**
   * Deletes all user shopping lists associated with a given shopping list ID.
   *
   * This method retrieves all user IDs associated with the specified shopping list ID
   * and then deletes each user's shopping list in a batch operation.
   *
   * @param shoppingListId - The ID of the shopping list to delete for all users.
   * @returns A promise that resolves when the operation is complete.
   */
  async deleteAllUsersShoppingLists(shoppingListId: string): Promise<void> {
    const userIds =
      await this.userShoppingListRepository.listUserIdsByShoppingListId(shoppingListId)

    this.batchRepository.runBatch(async batch => {
      for (const userId of userIds) {
        this.userShoppingListRepository.deleteWithBatch(batch, userId, shoppingListId)
      }
    })
  }

  /**
   * Generates a new user-specific shopping list from an existing shopping list.
   *
   * @param userId - The ID of the user for whom the shopping list is being generated.
   * @param shoppingList - The existing shopping list to base the new user shopping list on.
   * @returns A promise that resolves to the newly created user shopping list.
   */
  private async generateNewUserShoppingListFromShoppingList(
    userId: string,
    shoppingList: ShoppingList
  ): Promise<UserShoppingList> {
    const newOrderIndex = await this.fetchNewShoppingListOrderIndex(userId)
    return {
      id: shoppingList.id,
      orderIndex: newOrderIndex,
      name: shoppingList.name,
      ownerUserId: shoppingList.ownerUserId,
    }
  }

  /**
   * Fetches the new order index for a shopping list for a given user.
   *
   * This method retrieves the current maximum order index for the user's shopping list
   * and returns the next order index. If no order index is found, it returns 0.
   *
   * @param userId - The ID of the user whose shopping list order index is to be fetched.
   * @returns A promise that resolves to the new order index for the shopping list.
   */
  private async fetchNewShoppingListOrderIndex(userId: string): Promise<number> {
    const currentMaxOrderIndex = await this.userShoppingListRepository.fetchMaxOrderIndex(userId)
    return isNil(currentMaxOrderIndex) ? 0 : currentMaxOrderIndex + 1
  }
}
