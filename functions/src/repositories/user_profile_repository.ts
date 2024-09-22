import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import { UserProfile, UserProfileData } from '../models/user_profile'
import { FirestoreModelRepository } from './firestore_model_repository'
import { FirestoreReference } from './firestore_reference'

/**
 * Repository class for managing user profiles in Firestore.
 *
 * This class extends the `FirestoreModelRepository` and implements the `FirestoreReference` interface
 * to provide methods for interacting with user profiles stored in Firestore. It includes methods
 * for creating, updating, deleting, and querying user profiles.
 */
export class UserProfileRepository
  extends FirestoreModelRepository<UserProfileData, UserProfile>
  implements FirestoreReference<UserProfileData>
{
  //
  // --- Paths ---
  //

  collectionGroupId(): string {
    return `user_profiles`
  }

  collectionPath(): string {
    return `/${this.collectionGroupId()}`
  }

  documentPath(userId: string): string {
    return `${this.collectionPath()}/${userId}`
  }

  //
  // --- References ---
  //

  collectionGroupRef(): admin.firestore.CollectionGroup<UserProfileData> {
    return this.firestore
      .collectionGroup(this.collectionGroupId())
      .withConverter(this.dataConverter)
  }

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

  /**
   * Checks if a user profile exists for the given user ID.
   *
   * @param userId - The ID of the user to check for existence.
   * @returns A promise that resolves to a boolean indicating whether the user profile exists.
   */
  isExists(userId: string): Promise<boolean> {
    return this.isExistsFromRef(this.documentRef(userId))
  }

  /**
   * Creates a new user profile document in the repository.
   *
   * @param userId - The unique identifier for the user.
   * @param data - The user profile data to be stored.
   * @returns A promise that resolves when the user profile is successfully created.
   */
  create(userId: string, data: UserProfileData): Promise<void> {
    return this.createFromRef(this.documentRef(userId), data)
  }

  /**
   * Updates the user profile data for a given user ID.
   *
   * @param userId - The unique identifier of the user whose profile is to be updated.
   * @param data - A partial object containing the user profile data to be updated.
   * @returns A promise that resolves when the update operation is complete.
   */
  update(userId: string, data: Partial<UserProfileData>): Promise<void> {
    return this.updateFromRef(this.documentRef(userId), data)
  }

  /**
   * Checks if the specified username exists in the collection
   * and returns a boolean indicating whether it matches.
   *
   * @param userName - The username to check.
   * @returns A Promise resolving to a boolean indicating the match result.
   */
  async isUserNameMatched(userName: string): Promise<boolean> {
    const ds = await this.collectionRef().where('name', '==', userName).get()
    return !ds.empty
  }
}
