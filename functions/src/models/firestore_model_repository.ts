import * as admin from 'firebase-admin'
import { isNil, isUndefined } from 'lodash'
import { FirestoreModel } from '../models/firestore_model'
import { FirestoreRepository } from './firestore_repository'
import assert = require('assert')

export abstract class FirestoreModelRepository<
  T extends FirestoreModel,
> extends FirestoreRepository {
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
    fromFirestore: ds =>
      ({
        id: ds.id,
        ...ds.data(),
      }) as T,
    toFirestore: data => {
      delete data.id
      return data
    },
  }

  //
  // --- GET ---
  //

  async get(id: string): Promise<T | undefined> {
    const ds = await this.documentRef(id).get()
    return ds.data()
  }

  async getWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string
  ): Promise<T | undefined> {
    const ds = await transaction.get(this.documentRef(id))
    return ds.data()
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
    assert(isUndefined(data.id), 'id must be undefined')
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
    assert(isUndefined(data.id), 'id must be undefined')
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
    assert(isUndefined(data.id), 'id must be undefined')
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

  async create(data: T): Promise<void> {
    assert(data.id, 'id is required')
    await this.documentRef(data.id).create(data)
  }

  async createWithTransaction(
    transaction: admin.firestore.Transaction,
    data: T
  ): Promise<admin.firestore.Transaction> {
    assert(data.id, 'id is required')
    transaction.create(this.documentRef(data.id), data)
    return transaction
  }

  async createWithBatch(
    batch: admin.firestore.WriteBatch,
    data: T
  ): Promise<admin.firestore.WriteBatch> {
    assert(data.id, 'id is required')
    batch.create(this.documentRef(data.id), data)
    return batch
  }

  //
  // --- SET ---
  //

  async set(data: T): Promise<void>
  async set(data: T, options: admin.firestore.SetOptions): Promise<void>
  async set(data: T, options?: admin.firestore.SetOptions): Promise<void> {
    assert(data.id, 'id is required')
    if (options) {
      await this.documentRef(data.id).set(data, options)
    } else {
      await this.documentRef(data.id).set(data)
    }
  }

  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    data: T
  ): Promise<admin.firestore.Transaction>
  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    data: T,
    options: admin.firestore.SetOptions
  ): Promise<admin.firestore.Transaction>
  async setWithTransaction(
    transaction: admin.firestore.Transaction,
    data: T,
    options?: admin.firestore.SetOptions
  ): Promise<admin.firestore.Transaction> {
    assert(data.id, 'id is required')
    if (options) {
      transaction.set(this.documentRef(data.id), data, options)
    } else {
      transaction.set(this.documentRef(data.id), data)
    }
    return transaction
  }

  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    data: T
  ): Promise<admin.firestore.WriteBatch>
  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    data: T,
    options: admin.firestore.SetOptions
  ): Promise<admin.firestore.WriteBatch>
  async setWithBatch(
    batch: admin.firestore.WriteBatch,
    data: T,
    options?: admin.firestore.SetOptions
  ): Promise<admin.firestore.WriteBatch> {
    assert(data.id, 'id is required')
    if (options) {
      batch.set(this.documentRef(data.id), data, options)
    } else {
      batch.set(this.documentRef(data.id), data)
    }
    return batch
  }
  
  //
  // --- UPDATE ---
  //

  async update(id: string, data: object): Promise<void> {
    await this.documentRef(id).update(data)
  }

  async updateWithTransaction(
    transaction: admin.firestore.Transaction,
    id: string,
    data: object
  ): Promise<admin.firestore.Transaction> {
    transaction.update(this.documentRef(id), data)
    return transaction
  }

  async updateWithBatch(
    batch: admin.firestore.WriteBatch,
    id: string,
    data: object
  ): Promise<admin.firestore.WriteBatch> {
    batch.update(this.documentRef(id), data)
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
