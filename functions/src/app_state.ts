import * as admin from 'firebase-admin'
import { BatchRepository } from './repositories/batch_repository'
import { ShoppingListRepository } from './repositories/shopping_list_repository'
import { TransactionRepository } from './repositories/transaction_repository'
import { UserProfileRepository } from './repositories/user_profile_repository'
import { UserShoppingListRepository } from './repositories/user_shopping_list_repository'
import { ShoppingListService } from './services/shopping_list_service'
import { UserService } from './services/user_service'

/**
 * The AppState class manages the application's state.
 * It holds multiple repositories and services, initializing and providing them as needed.
 */
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

  private _batchRepository?: BatchRepository
  get batchRepository(): BatchRepository {
    if (!this._batchRepository) {
      this._batchRepository = new BatchRepository(this.app.firestore())
    }
    return this._batchRepository!
  }

  private _userProfileRepository?: UserProfileRepository
  get userProfileRepository(): UserProfileRepository {
    if (!this._userProfileRepository) {
      this._userProfileRepository = new UserProfileRepository(this.app.firestore())
    }
    return this._userProfileRepository!
  }

  private _userShoppingListRepository?: UserShoppingListRepository
  get userShoppingListRepository(): UserShoppingListRepository {
    if (!this._userShoppingListRepository) {
      this._userShoppingListRepository = new UserShoppingListRepository(this.app.firestore())
    }
    return this._userShoppingListRepository!
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

  private _shoppingListService?: ShoppingListService
  get shoppingListService(): ShoppingListService {
    if (!this._shoppingListService) {
      this._shoppingListService = new ShoppingListService(
        this.shoppingListRepository,
        this.userShoppingListRepository
      )
    }
    return this._shoppingListService!
  }
}
