import * as admin from 'firebase-admin'

export interface FirestoreReference<T> {
  // Path to the collection in Firestore.
  collectionPath(): string

  // Path to the document in Firestore
  documentPath(id: string): string

  // Reference to the collection in Firestore.
  collectionRef(): admin.firestore.CollectionReference<T>

  // Reference to the document in Firestore.
  documentRef(id?: string): admin.firestore.DocumentReference<T>
}
