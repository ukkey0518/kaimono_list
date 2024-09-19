import { ShoppingListRepository } from '../repositories/shopping_list_repository'
import { UserShoppingListRepository } from '../repositories/user_shopping_list_repository'

export class ShoppingListService {
  constructor(
    private shoppingListRepository: ShoppingListRepository,
    private userShoppingListRepository: UserShoppingListRepository
  ) {}

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
