import * as admin from 'firebase-admin'

export abstract class FirestoreRepository {
  constructor(protected firestore: admin.firestore.Firestore) {}
}
