import { FirestoreRepository } from './firestore_repository'

/**
 * A repository class for executing Firestore batch operations.
 * Extends the `FirestoreRepository` class.
 */
export class BatchRepository extends FirestoreRepository {
  /**
   * Executes a batch operation in Firestore.
   *
   * @param updateFunction - A function that takes a Firestore WriteBatch as an argument.
   *                         This function should contain the operations to be performed
   *                         within the batch. It can return a Promise or void.
   * @returns A Promise that resolves when the batch operation is committed.
   */
  async runBatch(
    updateFunction: (batch: FirebaseFirestore.WriteBatch) => Promise<void> | void
  ): Promise<void> {
    const batch = this.firestore.batch()
    await updateFunction(batch)
    await batch.commit()
  }
}
