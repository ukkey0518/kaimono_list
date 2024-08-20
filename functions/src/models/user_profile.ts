import { FirestoreModel } from './firestore_model'

export interface UserProfile extends FirestoreModel {
  name?: string
}
