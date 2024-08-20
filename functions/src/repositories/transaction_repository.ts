import { FirestoreRepository } from './firestore_repository'

export class TransactionRepository extends FirestoreRepository {
  async runTransaction<T>(
    updateFunction: (transaction: FirebaseFirestore.Transaction) => Promise<T>
  ): Promise<T> {
    return this.firestore.runTransaction(updateFunction)
  }
}
