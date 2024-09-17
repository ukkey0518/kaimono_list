import * as admin from 'firebase-admin'
import { Entity } from '../models/entity'
import { FirestoreRepository } from './firestore_repository'

export abstract class FirestoreModelRepository<
  D extends admin.firestore.DocumentData,
  E extends Entity<D>,
> extends FirestoreRepository {
  dataConverter: admin.firestore.FirestoreDataConverter<D> = {
    fromFirestore: ds => ds.data() as D,
    toFirestore: data => data,
  }

  //
  // --- GET ---
  //

  protected async fetchFromRef(
    documentRef: admin.firestore.DocumentReference
  ): Promise<E | undefined> {
    const ds = await documentRef.get()
    if (!ds.exists) {
      return undefined
    }
    return {
      id: ds.id,
      ...(ds.data() as D),
    } as E
  }

  protected async fetchWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference
  ): Promise<E | undefined> {
    const ds = await transaction.get(documentRef)
    if (!ds.exists) {
      return undefined
    }
    return {
      id: ds.id,
      ...(ds.data() as D),
    } as E
  }

  //
  // --- EXISTS ---
  //

  protected async isExistsFromRef(
    documentRef: admin.firestore.DocumentReference
  ): Promise<boolean> {
    const ds = await documentRef.get()
    return ds.exists
  }

  protected async isExistsWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference
  ): Promise<boolean> {
    const ds = await transaction.get(documentRef)
    return ds.exists
  }

  //
  // --- ADD ---
  //

  protected async addFromRef(
    collectionRef: admin.firestore.CollectionReference,
    data: D
  ): Promise<string> {
    const dRef = await collectionRef.add(data)
    return dRef.id
  }

  protected addWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    collectionRef: admin.firestore.CollectionReference,
    data: D
  ): {
    transaction: admin.firestore.Transaction
    id: string
  } {
    const ref = collectionRef.doc().withConverter(this.dataConverter)
    transaction.set(ref, data)
    return {
      transaction,
      id: ref.id,
    }
  }

  protected addWithBatchFromRef(
    batch: admin.firestore.WriteBatch,
    collectionRef: admin.firestore.CollectionReference,
    data: D
  ): {
    batch: admin.firestore.WriteBatch
    id: string
  } {
    const ref = collectionRef.doc().withConverter(this.dataConverter)
    batch.set(ref, data)
    return {
      batch,
      id: ref.id,
    }
  }

  //
  // --- CREATE ---
  //

  protected async createFromRef(
    documentRef: admin.firestore.DocumentReference,
    data: D
  ): Promise<void> {
    await documentRef.create(data)
  }

  protected createWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference,
    data: D
  ): admin.firestore.Transaction {
    transaction.create(documentRef, data)
    return transaction
  }

  protected createWithBatchFromRef(
    batch: admin.firestore.WriteBatch,
    documentRef: admin.firestore.DocumentReference,
    data: D
  ): admin.firestore.WriteBatch {
    batch.create(documentRef, data)
    return batch
  }

  //
  // --- SET ---
  //

  protected async setFromRef(
    documentRef: admin.firestore.DocumentReference,
    data: D,
    options?: admin.firestore.SetOptions
  ): Promise<void> {
    if (options) {
      await documentRef.set(data, options)
    } else {
      await documentRef.set(data)
    }
  }

  protected setWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference,
    data: D,
    options?: admin.firestore.SetOptions
  ): admin.firestore.Transaction {
    if (options) {
      transaction.set(documentRef, data, options)
    } else {
      transaction.set(documentRef, data)
    }
    return transaction
  }

  protected setWithBatchFromRef(
    batch: admin.firestore.WriteBatch,
    documentRef: admin.firestore.DocumentReference,
    data: D,
    options?: admin.firestore.SetOptions
  ): admin.firestore.WriteBatch {
    if (options) {
      batch.set(documentRef, data, options)
    } else {
      batch.set(documentRef, data)
    }
    return batch
  }

  //
  // --- UPDATE ---
  //

  protected async updateFromRef(
    documentRef: admin.firestore.DocumentReference,
    data: Partial<D>
  ): Promise<void> {
    await documentRef.update(data)
  }

  protected updateWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference,
    data: Partial<D>
  ): admin.firestore.Transaction {
    transaction.update(documentRef, data as admin.firestore.UpdateData<D>)
    return transaction
  }

  protected updateWithBatchFromRef(
    batch: admin.firestore.WriteBatch,
    documentRef: admin.firestore.DocumentReference,
    data: Partial<D>
  ): admin.firestore.WriteBatch {
    batch.update(documentRef, data as admin.firestore.UpdateData<D>)
    return batch
  }

  //
  // --- DELETE ---
  //

  protected async deleteFromRef(documentRef: admin.firestore.DocumentReference): Promise<void> {
    await documentRef.delete()
  }

  protected deleteWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference
  ): admin.firestore.Transaction {
    transaction.delete(documentRef)
    return transaction
  }

  protected deleteWithBatchFromRef(
    batch: admin.firestore.WriteBatch,
    documentRef: admin.firestore.DocumentReference
  ): admin.firestore.WriteBatch {
    batch.delete(documentRef)
    return batch
  }
}
