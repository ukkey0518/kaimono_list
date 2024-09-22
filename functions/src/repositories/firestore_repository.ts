import * as admin from 'firebase-admin'

/**
 * Abstract class for Firestore repositories.
 *
 * This class provides a base class for Firestore repositories to extend from.
 * It includes a reference to the Firestore instance for interacting with Firestore.
 */
export abstract class FirestoreRepository {
  constructor(protected firestore: admin.firestore.Firestore) {}
}
