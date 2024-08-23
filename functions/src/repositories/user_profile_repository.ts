import { UserProfile, UserProfileData } from '../models/user_profile'
import { FirestoreModelRepository } from './firestore_model_repository'

export class UserProfileRepository extends FirestoreModelRepository<UserProfileData, UserProfile> {
  collectionPath(): string {
    return '/user_profiles'
  }
}
