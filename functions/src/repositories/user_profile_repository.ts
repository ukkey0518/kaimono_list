import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import { UserProfile, UserProfileData } from '../models/user_profile'
import { FirestoreModelRepository } from './firestore_model_repository'

export class UserProfileRepository extends FirestoreModelRepository<UserProfileData, UserProfile> {
  //
  // --- Paths ---
  //

  collectionPath(): string {
    return `/user_profiles`
  }

  documentPath(userId: string): string {
    return `${this.collectionPath()}/${userId}`
  }

  //
  // --- References ---
  //

  collectionRef(): admin.firestore.CollectionReference<UserProfileData> {
    return this.firestore.collection(this.collectionPath()).withConverter(this.dataConverter)
  }

  documentRef(userId?: string): admin.firestore.DocumentReference<UserProfileData> {
    return (
      isNil(userId)
        ? this.firestore.collection(this.collectionPath()).doc()
        : this.firestore.doc(this.documentPath(userId))
    ).withConverter(this.dataConverter)
  }

  // ----------------------------------------------------------------------- //

  isExists(userId: string): Promise<boolean> {
    return this.isExistsFromRef(this.documentRef(userId))
  }

  create(userId: string, data: UserProfileData): Promise<void> {
    return this.createFromRef(this.documentRef(userId), data)
  }

  update(userId: string, data: Partial<UserProfileData>): Promise<void> {
    return this.updateFromRef(this.documentRef(userId), data)
  }

  /**
   * Checks if the specified username exists in the collection
   * and returns a boolean indicating whether it matches.
   *
   * @param {string} userName - The username to check.
   * @returns {Promise<boolean>} - A Promise resolving to a boolean indicating the match result.
   */
  async isUserNameMatched(userName: string): Promise<boolean> {
    const ds = await this.collectionRef().where('name', '==', userName).get()
    return !ds.empty
  }
}
