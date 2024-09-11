import * as admin from 'firebase-admin'
import { ShoppingListRepository } from './repositories/shopping_list_repository'
import { TransactionRepository } from './repositories/transaction_repository'
import { UserProfileRepository } from './repositories/user_profile_repository'
import { UserShoppingListSettingRepository } from './repositories/user_shopping_list_setting_repository'
import { UserService } from './services/user_service'

export class AppState {
  constructor(private app: admin.app.App) {}

  //
  // Repositories
  //

  private _transactionRepository?: TransactionRepository
  get transactionRepository(): TransactionRepository {
    if (!this._transactionRepository) {
      this._transactionRepository = new TransactionRepository(this.app.firestore())
    }
    return this._transactionRepository!
  }

  private _userProfileRepository?: UserProfileRepository
  get userProfileRepository(): UserProfileRepository {
    if (!this._userProfileRepository) {
      this._userProfileRepository = new UserProfileRepository(this.app.firestore())
    }
    return this._userProfileRepository!
  }

  private _userShoppingListSettingRepository?: UserShoppingListSettingRepository
  get userShoppingListSettingRepository(): UserShoppingListSettingRepository {
    if (!this._userShoppingListSettingRepository) {
      this._userShoppingListSettingRepository = new UserShoppingListSettingRepository(
        this.app.firestore()
      )
    }
    return this._userShoppingListSettingRepository!
  }

  private _shoppingListRepository?: ShoppingListRepository
  get shoppingListRepository(): ShoppingListRepository {
    if (!this._shoppingListRepository) {
      this._shoppingListRepository = new ShoppingListRepository(this.app.firestore())
    }
    return this._shoppingListRepository
  }

  //
  // Services
  //

  private _userService?: UserService
  get userService(): UserService {
    if (!this._userService) {
      this._userService = new UserService(this.userProfileRepository)
    }
    return this._userService!
  }
}
