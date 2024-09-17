import { FirestoreRepository } from './firestore_repository'

export class BatchRepository extends FirestoreRepository {
  async runBatch(
    updateFunction: (batch: FirebaseFirestore.WriteBatch) => Promise<void> | void
  ): Promise<void> {
    const batch = this.firestore.batch()
    await updateFunction(batch)
    await batch.commit()
  }
}
