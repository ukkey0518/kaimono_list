import {
  UserShoppingListSetting,
  UserShoppingListSettingData,
} from '../models/user_shopping_list_setting'
import { FirestoreModelRepository } from './firestore_model_repository'

export class UserShoppingListSettingRepository extends FirestoreModelRepository<
  UserShoppingListSettingData,
  UserShoppingListSetting
> {
  collectionPath(): string {
    return '/user_shopping_list_settings'
  }
}
