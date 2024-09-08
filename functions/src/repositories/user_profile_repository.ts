import { UserProfile, UserProfileData } from '../models/user_profile'
import { FirestoreModelRepository } from './firestore_model_repository'

export class UserProfileRepository extends FirestoreModelRepository<UserProfileData, UserProfile> {
  collectionPath(): string {
    return '/user_profiles'
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
