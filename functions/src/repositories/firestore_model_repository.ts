import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import { Entity } from '../models/entity'
import { FirestoreReference } from './firestore_reference'
import { FirestoreRepository } from './firestore_repository'

export abstract class FirestoreModelRepository<T extends admin.firestore.DocumentData>
  extends FirestoreRepository
  implements FirestoreReference<T>
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

  collectionRef(): admin.firestore.CollectionReference<T> {
    return this.firestore.collection(this.collectionPath()).withConverter(this.dataConverter)
  }

  documentRef(id?: string): admin.firestore.DocumentReference<T> {
    return (
      isNil(id)
        ? this.firestore.collection(this.collectionPath()).doc()
        : this.firestore.doc(this.documentPath(id))
    ).withConverter(this.dataConverter)
  }

  //
  // --- Data Converter ---
  //

  dataConverter: admin.firestore.FirestoreDataConverter<T> = {
    fromFirestore: ds => ds.data() as T,
    toFirestore: data => data,
  }

  //
  // --- GET ---
  //

  async get(id: string): Promise<Entity<T> | undefined> {
    const ds = await this.documentRef(id).get()
    if (!ds.exists) {
      return undefined
    }
    return {
      id: ds.id,
      ...(ds.data() as T),
    }
  }

  async getWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string
  ): Promise<Entity<T> | undefined> {
    const ds = await transaction.get(this.documentRef(id))
    if (!ds.exists) {
      return undefined
    }
    return {
      id: ds.id,
      ...(ds.data() as T),
    }
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

  async add(data: T): Promise<string> {
    const ref = await this.collectionRef().add(data)
    return ref.id
  }

  async addWithTransaction(
    transaction: admin.firestore.Transaction,
    data: T
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
    data: T
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

  async create(id: string, data: T): Promise<void> {
    await this.documentRef(id).create(data)
  }

  async createWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: T
  ): Promise<admin.firestore.Transaction> {
    transaction.create(this.documentRef(id), data)
    return transaction
  }

  async createWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: T
  ): Promise<admin.firestore.WriteBatch> {
    batch.create(this.documentRef(id), data)
    return batch
  }

  //
  // --- SET ---
  //

  async set(id: string, data: T): Promise<void>
  async set(id: string, data: T, options: admin.firestore.SetOptions): Promise<void>
  async set(id: string, data: T, options?: admin.firestore.SetOptions): Promise<void> {
    if (options) {
      await this.documentRef(id).set(data, options)
    } else {
      await this.documentRef(id).set(data)
    }
  }

  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: T
  ): Promise<admin.firestore.Transaction>
  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: T,
    options: admin.firestore.SetOptions
  ): Promise<admin.firestore.Transaction>
  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: T,
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
    data: T
  ): Promise<admin.firestore.WriteBatch>
  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: T,
    options: admin.firestore.SetOptions
  ): Promise<admin.firestore.WriteBatch>
  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: T,
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

  async update(id: string, data: Partial<T>): Promise<void> {
    await this.documentRef(id).update(data)
  }

  async updateWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: Partial<T>
  ): Promise<admin.firestore.Transaction> {
    transaction.update(this.documentRef(id), data as admin.firestore.UpdateData<T>)
    return transaction
  }

  async updateWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: Partial<T>
  ): Promise<admin.firestore.WriteBatch> {
    batch.update(this.documentRef(id), data as admin.firestore.UpdateData<T>)
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
