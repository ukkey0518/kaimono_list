import * as admin from 'firebase-admin'
import { EntityData } from '../models/entity'

export interface FirestoreReference<D extends EntityData> {
  // Path to the collection in Firestore.
  collectionPath(): string

  // Path to the document in Firestore
  documentPath(id: string): string

  // Reference to the collection in Firestore.
  collectionRef(): admin.firestore.CollectionReference<D>

  // Reference to the document in Firestore.
  documentRef(id?: string): admin.firestore.DocumentReference<D>
}
