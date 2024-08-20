import { FirestoreModelRepository } from '../firestore_model_repository'
import { UserProfile } from './user_profile'

export class UserProfileRepository extends FirestoreModelRepository<UserProfile> {
  collectionPath(): string {
    return '/user_profiles'
  }
}
