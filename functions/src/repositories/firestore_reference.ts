import * as admin from 'firebase-admin'

/**
 * Interface representing a Firestore reference with various methods to obtain
 * collection and document references and paths.
 *
 * @template D - The type of the document data.
 */
export interface FirestoreReference<D extends admin.firestore.DocumentData> {
  /**
   * Gets the ID of the collection group.
   *
   * @returns {string} The collection group ID.
   */
  collectionGroupId: () => string

  /**
   * Constructs the path to a collection.
   *
   * @param {...string} args - The segments of the collection path.
   * @returns {string} The collection path.
   */
  collectionPath: (...args: string[]) => string

  /**
   * Constructs the path to a document.
   *
   * @param {...string} args - The segments of the document path.
   * @returns {string} The document path.
   */
  documentPath: (...args: string[]) => string

  /**
   * Gets a reference to the collection group.
   *
   * @returns {admin.firestore.CollectionGroup<D>} The collection group reference.
   */
  collectionGroupRef: () => admin.firestore.CollectionGroup<D>

  /**
   * Gets a reference to a collection for a specific user.
   *
   * @param {string} userId - The ID of the user.
   * @returns {admin.firestore.CollectionReference<D>} The collection reference.
   */
  collectionRef: (userId: string) => admin.firestore.CollectionReference<D>

  /**
   * Gets a reference to a document.
   *
   * @param {...string} args - The segments of the document path.
   * @returns {admin.firestore.DocumentReference<D>} The document reference.
   */
  documentRef: (...args: string[]) => admin.firestore.DocumentReference<D>
}
