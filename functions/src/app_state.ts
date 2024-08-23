import * as admin from 'firebase-admin'
import { UserProfileRepository } from './repositories/user_profile_repository'
import { UserService } from './services/user_service'
import { TransactionRepository } from './repositories/transaction_repository'

export class AppState {
  constructor(private app: admin.app.App) {}

  //
  // Repositories
  //

  private _transactionRepository?: TransactionRepository
  get transactionRepository(): TransactionRepository {
    if (!this.transactionRepository) {
      this._transactionRepository = new TransactionRepository(this.app.firestore())
    }
    return this._transactionRepository!
  }

  private _userProfileRepository?: UserProfileRepository
  get userProfileRepository(): UserProfileRepository {
    if (!this.userProfileRepository) {
      this._userProfileRepository = new UserProfileRepository(this.app.firestore())
    }
    return this._userProfileRepository!
  }

  //
  // Services
  //

  private _userService?: UserService
  get userService(): UserService {
    if (!this.userService) {
      this._userService = new UserService(this.userProfileRepository)
    }
    return this._userService!
  }
}
