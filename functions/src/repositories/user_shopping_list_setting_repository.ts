import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import {
  UserShoppingListSetting,
  UserShoppingListSettingData,
} from '../models/user_shopping_list_setting'
import { FirestoreModelRepository } from './firestore_model_repository'

export class UserShoppingListSettingRepository extends FirestoreModelRepository<
  UserShoppingListSettingData,
  UserShoppingListSetting
> {
  //
  // --- Paths ---
  //

  collectionPath(): string {
    return `/user_shopping_list_settings`
  }

  documentPath(userId: string): string {
    return `${this.collectionPath()}/${userId}`
  }

  //
  // --- References ---
  //

  collectionRef(): admin.firestore.CollectionReference<UserShoppingListSettingData> {
    return this.firestore.collection(this.collectionPath()).withConverter(this.dataConverter)
  }

  documentRef(userId?: string): admin.firestore.DocumentReference<UserShoppingListSettingData> {
    return (
      isNil(userId)
        ? this.firestore.collection(this.collectionPath()).doc()
        : this.firestore.doc(this.documentPath(userId))
    ).withConverter(this.dataConverter)
  }

  // ----------------------------------------------------------------------- //

  set(
    userId: string,
    data: UserShoppingListSettingData,
    options?: admin.firestore.SetOptions
  ): Promise<void> {
    return this.setFromRef(this.documentRef(userId), data, options)
  }
}
