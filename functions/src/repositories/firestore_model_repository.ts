import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import { Entity, EntityData } from '../models/entity'
import { FirestoreReference } from './firestore_reference'
import { FirestoreRepository } from './firestore_repository'

export abstract class FirestoreModelRepository<D extends EntityData, E extends Entity<D>>
  extends FirestoreRepository
  implements FirestoreReference<D>
{
  //
  // --- Paths ---
  //

  abstract collectionPath(): string

  documentPath(id: string): string {
    return `${this.collectionPath()}/${id}`
  }

  //
  // --- References ---
  //

  collectionRef(): admin.firestore.CollectionReference<D> {
    return this.firestore.collection(this.collectionPath()).withConverter(this.dataConverter)
  }

  documentRef(id?: string): admin.firestore.DocumentReference<D> {
    return (
      isNil(id)
        ? this.firestore.collection(this.collectionPath()).doc()
        : this.firestore.doc(this.documentPath(id))
    ).withConverter(this.dataConverter)
  }

  //
  // --- Data Converter ---
  //

  dataConverter: admin.firestore.FirestoreDataConverter<D> = {
    fromFirestore: ds => ds.data() as D,
    toFirestore: data => data,
  }

  //
  // --- GET ---
  //

  async get(id: string): Promise<E | undefined> {
    const ds = await this.documentRef(id).get()
    if (!ds.exists) {
      return undefined
    }
    return {
      id: ds.id,
      ...(ds.data() as D),
    } as E
  }

  async getWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string
  ): Promise<E | undefined> {
    const ds = await transaction.get(this.documentRef(id))
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

  async isExists(id: string): Promise<boolean> {
    const ds = await this.documentRef(id).get()
    return ds.exists
  }

  async isExistsWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string
  ): Promise<boolean> {
    const ds = await transaction.get(this.documentRef(id))
    return ds.exists
  }

  //
  // --- ADD ---
  //

  async add(data: D): Promise<string> {
    const ref = await this.collectionRef().add(data)
    return ref.id
  }

  async addWithTransaction(
    transaction: admin.firestore.Transaction,
    data: D
  ): Promise<{
    transaction: admin.firestore.Transaction
    id: string
  }> {
    const ref = this.documentRef()
    transaction.set(ref, data)
    return {
      transaction,
      id: ref.id,
    }
  }

  async addWithBatch(
    batch: admin.firestore.WriteBatch,
    data: D
  ): Promise<{
    batch: admin.firestore.WriteBatch
    id: string
  }> {
    const ref = this.documentRef()
    batch.set(ref, data)
    return {
      batch,
      id: ref.id,
    }
  }

  //
  // --- CREATE ---
  //

  async create(id: string, data: D): Promise<void> {
    await this.documentRef(id).create(data)
  }

  async createWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: D
  ): Promise<admin.firestore.Transaction> {
    transaction.create(this.documentRef(id), data)
    return transaction
  }

  async createWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: D
  ): Promise<admin.firestore.WriteBatch> {
    batch.create(this.documentRef(id), data)
    return batch
  }

  //
  // --- SET ---
  //

  async set(id: string, data: D): Promise<void>
  async set(id: string, data: D, options: admin.firestore.SetOptions): Promise<void>
  async set(id: string, data: D, options?: admin.firestore.SetOptions): Promise<void> {
    if (options) {
      await this.documentRef(id).set(data, options)
    } else {
      await this.documentRef(id).set(data)
    }
  }

  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: D
  ): Promise<admin.firestore.Transaction>
  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: D,
    options: admin.firestore.SetOptions
  ): Promise<admin.firestore.Transaction>
  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: D,
    options?: admin.firestore.SetOptions
  ): Promise<admin.firestore.Transaction> {
    if (options) {
      transaction.set(this.documentRef(id), data, options)
    } else {
      transaction.set(this.documentRef(id), data)
    }
    return transaction
  }

  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: D
  ): Promise<admin.firestore.WriteBatch>
  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: D,
    options: admin.firestore.SetOptions
  ): Promise<admin.firestore.WriteBatch>
  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: D,
    options?: admin.firestore.SetOptions
  ): Promise<admin.firestore.WriteBatch> {
    if (options) {
      batch.set(this.documentRef(id), data, options)
    } else {
      batch.set(this.documentRef(id), data)
    }
    return batch
  }

  //
  // --- UPDATE ---
  //

  async update(id: string, data: Partial<D>): Promise<void> {
    await this.documentRef(id).update(data)
  }

  async updateWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: Partial<D>
  ): Promise<admin.firestore.Transaction> {
    transaction.update(this.documentRef(id), data as admin.firestore.UpdateData<D>)
    return transaction
  }

  async updateWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: Partial<D>
  ): Promise<admin.firestore.WriteBatch> {
    batch.update(this.documentRef(id), data as admin.firestore.UpdateData<D>)
    return batch
  }

  //
  // --- DELETE ---
  //

  async delete(id: string): Promise<void> {
    await this.documentRef(id).delete()
  }

  async deleteWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string
  ): Promise<admin.firestore.Transaction> {
    transaction.delete(this.documentRef(id))
    return transaction
  }

  async deleteWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string
  ): Promise<admin.firestore.WriteBatch> {
    batch.delete(this.documentRef(id))
    return batch
  }
}
