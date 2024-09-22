import { FirestoreRepository } from './firestore_repository'

/**
 * A repository class for executing Firestore transactions.
 * Extends the `FirestoreRepository` class.
 */
export class TransactionRepository extends FirestoreRepository {
  /**
   * Executes a Firestore transaction.
   *
   * @template T - The type of the result returned by the transaction.
   * @param updateFunction -
   *        A function that contains the operations to be performed within the transaction.
   *        It receives a `FirebaseFirestore.Transaction` object as an argument and returns a promise.
   * @returns A promise that resolves with the result of the transaction.
   */
  async runTransaction<T>(
    updateFunction: (transaction: FirebaseFirestore.Transaction) => Promise<T>
  ): Promise<T> {
    return this.firestore.runTransaction(updateFunction)
  }
}
