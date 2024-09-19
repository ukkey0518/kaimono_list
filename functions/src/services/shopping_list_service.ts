import { isNil } from 'lodash'
import { ShoppingListRepository } from '../repositories/shopping_list_repository'
import { UserShoppingListRepository } from '../repositories/user_shopping_list_repository'

export class ShoppingListService {
  constructor(
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
   * Synchronizes the shopping list with all user shopping lists.
   *
   * This method fetches the shopping list by its ID and updates all user shopping lists
   * with the name of the fetched shopping list. If the shopping list does not exist,
   * it deletes all user shopping lists associated with the given shopping list ID.
   *
   * @param shoppingListId - The ID of the shopping list to synchronize.
   * @returns A promise that resolves when the synchronization is complete.
   */
  async syncShoppingListUserShoppingLists(shoppingListId: string): Promise<void> {
    const shoppingList = await this.shoppingListRepository.fetch(shoppingListId)

    if (shoppingList) {
      await this.userShoppingListRepository.updateAllUsersShoppingLists(shoppingListId, {
        name: shoppingList.name,
      })
    } else {
      await this.userShoppingListRepository.deleteAllUsersShoppingLists(shoppingListId)
    }
  }
}
