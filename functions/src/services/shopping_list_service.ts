import { isNil } from 'lodash'
import { BatchRepository } from '../repositories/batch_repository'
import { ShoppingListRepository } from '../repositories/shopping_list_repository'
import { UserShoppingListRepository } from '../repositories/user_shopping_list_repository'

export class ShoppingListService {
  constructor(
    private batchRepository: BatchRepository,
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

    const currentMaxOrderIndex = await this.userShoppingListRepository.fetchMaxOrderIndex(userId)

    const newOrderIndex = isNil(currentMaxOrderIndex) ? 0 : currentMaxOrderIndex + 1

    await this.userShoppingListRepository.create(userId, {
      id: shoppingListId,
      orderIndex: newOrderIndex,
      name: shoppingList.name,
    })
  }

  /**
   * Synchronizes the shopping lists of all users associated with a given shopping list ID.
   *
   * This method fetches the shopping list by its ID and retrieves all user IDs associated with it.
   * It then updates each user's shopping list with the latest information from the fetched shopping list.
   *
   * @param shoppingListId - The ID of the shopping list to synchronize.
   * @returns A promise that resolves when the synchronization is complete.
   */
  async syncAllUsersShoppingLists(shoppingListId: string): Promise<void> {
    const shoppingList = await this.shoppingListRepository.fetch(shoppingListId)
    if (!shoppingList) {
      // TODO(Ukkey): Implement custom logger
      console.error(`Shopping list not found: ${shoppingListId}`)
      return
    }

    const userIds =
      await this.userShoppingListRepository.listUserIdsByShoppingListId(shoppingListId)

    this.batchRepository.runBatch(async batch => {
      for (const userId of userIds) {
        this.userShoppingListRepository.updateWithBatch(batch, userId, shoppingListId, {
          name: shoppingList.name,
        })
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
}
