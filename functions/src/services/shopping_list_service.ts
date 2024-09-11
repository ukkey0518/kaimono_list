import { UserShoppingListData } from '../models/user_shopping_list_setting'
import { ShoppingListRepository } from '../repositories/shopping_list_repository'
import { UserShoppingListSettingRepository } from '../repositories/user_shopping_list_setting_repository'

export class ShoppingListService {
  constructor(
    private shoppingListRepository: ShoppingListRepository,
    private userShoppingListSettingRepository: UserShoppingListSettingRepository
  ) {}

  async syncShoppingListsWithUserSettings(userId: string): Promise<void> {
    const shoppingLists = await this.shoppingListRepository.listByOwnerUserId(userId)

    const newUserShoppingLists: UserShoppingListData[] = shoppingLists.map(shoppingList => ({
      id: shoppingList.id,
      name: shoppingList.name,
    }))

    await this.userShoppingListSettingRepository.update(userId, {
      userShoppingLists: newUserShoppingLists,
    })
  }
}
