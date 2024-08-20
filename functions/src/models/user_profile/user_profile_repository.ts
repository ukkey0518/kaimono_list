import { FirestoreModelRepository } from '../firestore_model_repository'
import { UserProfile } from './user_profile'

export class UserProfileRepository extends FirestoreModelRepository<UserProfile> {
  collectionPath(): string {
    return '/user_profiles'
  }

  async get(id: string): Promise<UserProfile | undefined> {
    const ds = await this.documentRef(id).get()
    return ds.data()
  }

  async set(data: UserProfile, { merge = true }): Promise<void> {
    await this.documentRef(data.id).set(data, { merge })
  }

  async isExists(id: string): Promise<boolean> {
    const ds = await this.documentRef(id).get()
    return ds.exists
  }
}
