import * as admin from 'firebase-admin'
import { Entity } from '../models/entity'
import { FirestoreRepository } from './firestore_repository'

/**
 * Abstract class representing a Firestore model repository.
 *
 * This class provides methods for interacting with Firestore documents and collections,
 * including fetching, adding, creating, setting, updating, and deleting documents.
 * It uses a generic type `D` for the Firestore document data and `E` for the entity type.
 *
 * @template D - The type of Firestore document data.
 * @template E - The type of entity.
 */
export abstract class FirestoreModelRepository<
  D extends admin.firestore.DocumentData,
  E extends Entity<D>,
> extends FirestoreRepository {
  /**
   * Firestore data converter for the generic type `D`.
   *
   * This converter is used to transform Firestore documents to instances of `D` and vice versa.
   *
   * - `fromFirestore`: Converts a Firestore document snapshot to an instance of `D`.
   * - `toFirestore`: Converts an instance of `D` to a Firestore document, excluding the `id` field.
   *
   * @type {admin.firestore.FirestoreDataConverter<D>}
   */
  protected dataConverter: admin.firestore.FirestoreDataConverter<D> = {
    fromFirestore: ds => ds.data() as D,
    toFirestore: data => {
      const d = { ...data }
      delete d.id
      return d
    },
  }

  /**
   * Converts a Firestore DocumentSnapshot to an entity of type E.
   *
   * @param ds - The Firestore DocumentSnapshot to convert.
   * @returns The entity of type E if the document exists, otherwise undefined.
   */
  protected documentSnapshotToEntity(ds: admin.firestore.DocumentSnapshot): E | undefined {
    if (!ds.exists) {
      return undefined
    }
    return {
      id: ds.id,
      ...(ds.data() as D),
    } as E
  }

  /**
   * Converts a Firestore QueryDocumentSnapshot to an entity of type E.
   *
   * @param ds - The Firestore QueryDocumentSnapshot to convert.
   * @returns An entity of type E with the data from the snapshot.
   */
  protected queryDocumentSnapshotToEntity(ds: admin.firestore.QueryDocumentSnapshot): E {
    return {
      id: ds.id,
      ...(ds.data() as D),
    } as E
  }

  //
  // --- GET ---
  //

  /**
   * Fetches a document from the provided Firestore document reference.
   *
   * @param documentRef - The Firestore document reference to fetch the document from.
   * @returns A promise that resolves to the entity of type `E` if the document exists, or `undefined` if it does not.
   */
  protected async fetchFromRef(
    documentRef: admin.firestore.DocumentReference
  ): Promise<E | undefined> {
    const ds = await documentRef.get()
    if (!ds.exists) {
      return undefined
    }
    return this.documentSnapshotToEntity(ds)
  }

  /**
   * Fetches a document from Firestore within a transaction using the provided document reference.
   * If the document does not exist, it returns `undefined`.
   *
   * @param transaction - The Firestore transaction to use for fetching the document.
   * @param documentRef - The reference to the Firestore document to fetch.
   * @returns A promise that resolves to the entity represented by the document, or `undefined` if the document does not exist.
   */
  protected async fetchWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference
  ): Promise<E | undefined> {
    const ds = await transaction.get(documentRef)
    if (!ds.exists) {
      return undefined
    }
    return this.documentSnapshotToEntity(ds)
  }

  /**
   * Retrieves a list of entities from the specified Firestore collection reference.
   *
   * @param collectionRef - The Firestore collection reference to query.
   * @returns A promise that resolves to an array of entities.
   */
  protected async listFromRef(collectionRef: admin.firestore.CollectionReference): Promise<E[]> {
    const qs = await collectionRef.get()
    return qs.docs.map(this.queryDocumentSnapshotToEntity)
  }

  /**
   * Retrieves a list of entities from a Firestore collection reference within a transaction.
   *
   * @param transaction - The Firestore transaction to use for the retrieval.
   * @param collectionRef - The Firestore collection reference from which to retrieve the entities.
   * @returns A promise that resolves to an array of entities of type E.
   */
  protected async listWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    collectionRef: admin.firestore.CollectionReference
  ): Promise<E[]> {
    const qs = await transaction.get(collectionRef)
    return qs.docs.map(this.queryDocumentSnapshotToEntity)
  }

  //
  // --- EXISTS ---
  //

  /**
   * Checks if a document exists at the given Firestore document reference.
   *
   * @param documentRef - The Firestore document reference to check.
   * @returns A promise that resolves to `true` if the document exists, otherwise `false`.
   */
  protected async isExistsFromRef(
    documentRef: admin.firestore.DocumentReference
  ): Promise<boolean> {
    const ds = await documentRef.get()
    return ds.exists
  }

  /**
   * Checks if a document exists within a Firestore transaction.
   *
   * @param transaction - The Firestore transaction to use for the check.
   * @param documentRef - The reference to the Firestore document to check.
   * @returns A promise that resolves to a boolean indicating whether the document exists.
   */
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

  /**
   * Adds a document to the specified Firestore collection reference and returns the document ID.
   *
   * @param collectionRef - The Firestore collection reference where the document will be added.
   * @param data - The data to be added to the collection.
   * @returns A promise that resolves to the ID of the added document.
   */
  protected async addFromRef(
    collectionRef: admin.firestore.CollectionReference,
    data: D
  ): Promise<string> {
    const dRef = await collectionRef.add(data)
    return dRef.id
  }

  /**
   * Adds a document to a Firestore collection within a transaction using a reference.
   *
   * @param transaction - The Firestore transaction to use.
   * @param collectionRef - The reference to the Firestore collection.
   * @param data - The data to be added to the collection.
   * @returns An object containing the transaction and the ID of the newly added document.
   */
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

  /**
   * Adds a document to a Firestore collection using a batch operation and returns the updated batch and the document ID.
   *
   * @param batch - The Firestore write batch to which the operation will be added.
   * @param collectionRef - The reference to the Firestore collection where the document will be added.
   * @param data - The data to be added to the Firestore collection.
   * @returns An object containing the updated batch and the ID of the newly added document.
   */
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

  /**
   * Creates a new document in Firestore from the provided document reference and data.
   *
   * @param documentRef - The Firestore document reference where the new document will be created.
   * @param data - The data to be stored in the new document.
   * @returns A promise that resolves when the document has been successfully created.
   */
  protected async createFromRef(
    documentRef: admin.firestore.DocumentReference,
    data: D
  ): Promise<void> {
    await documentRef.create(data)
  }

  /**
   * Creates a new document within a Firestore transaction using the provided document reference and data.
   *
   * @param transaction - The Firestore transaction in which the document will be created.
   * @param documentRef - The reference to the Firestore document to be created.
   * @param data - The data to be stored in the new document.
   * @returns The Firestore transaction after the document has been created.
   */
  protected createWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference,
    data: D
  ): admin.firestore.Transaction {
    transaction.create(documentRef, data)
    return transaction
  }

  /**
   * Adds a create operation to the provided Firestore WriteBatch for the specified document reference and data.
   *
   * @param batch - The Firestore WriteBatch to which the create operation will be added.
   * @param documentRef - The reference to the Firestore document where the data will be created.
   * @param data - The data to be created in the specified document reference.
   * @returns The updated Firestore WriteBatch with the create operation added.
   */
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

  /**
   * Sets the data for the specified Firestore document reference.
   *
   * @param documentRef - The Firestore document reference where the data will be set.
   * @param data - The data to set in the document.
   * @param options - Optional settings object to configure the set behavior.
   * @returns A promise that resolves when the data has been successfully set.
   */
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

  /**
   * Sets data to a Firestore document reference within a transaction.
   *
   * @param transaction - The Firestore transaction to use.
   * @param documentRef - The reference to the Firestore document where data will be set.
   * @param data - The data to set in the Firestore document.
   * @param options - Optional settings that can be provided to configure the set operation.
   * @returns The Firestore transaction after setting the data.
   */
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

  /**
   * Sets data to a Firestore document reference within a batch operation.
   *
   * @param batch - The Firestore WriteBatch instance to use for the operation.
   * @param documentRef - The Firestore DocumentReference where the data will be set.
   * @param data - The data to set in the document.
   * @param options - Optional settings that can be used to configure the set operation.
   * @returns The updated WriteBatch instance.
   */
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

  /**
   * Updates a Firestore document with the provided data.
   *
   * @param documentRef - A reference to the Firestore document to be updated.
   * @param data - A partial object containing the fields to be updated in the document.
   * @returns A promise that resolves when the update operation is complete.
   */
  protected async updateFromRef(
    documentRef: admin.firestore.DocumentReference,
    data: Partial<D>
  ): Promise<void> {
    await documentRef.update(data)
  }

  /**
   * Updates a Firestore document within a transaction using a document reference and partial data.
   *
   * @param transaction - The Firestore transaction to perform the update within.
   * @param documentRef - The reference to the Firestore document to be updated.
   * @param data - The partial data to update the document with.
   * @returns The Firestore transaction after the update operation.
   */
  protected updateWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference,
    data: Partial<D>
  ): admin.firestore.Transaction {
    transaction.update(documentRef, data as admin.firestore.UpdateData<D>)
    return transaction
  }

  /**
   * Updates a Firestore document within a batch operation.
   *
   * @param batch - The Firestore WriteBatch instance used for the batch operation.
   * @param documentRef - The reference to the Firestore document to be updated.
   * @param data - The partial data to update the document with.
   * @returns The updated Firestore WriteBatch instance.
   */
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

  /**
   * Deletes a document from Firestore using the provided document reference.
   *
   * @param documentRef - The reference to the Firestore document to be deleted.
   * @returns A promise that resolves when the document has been successfully deleted.
   */
  protected async deleteFromRef(documentRef: admin.firestore.DocumentReference): Promise<void> {
    await documentRef.delete()
  }

  /**
   * Deletes a document within a Firestore transaction.
   *
   * @param transaction - The Firestore transaction to use for the delete operation.
   * @param documentRef - The reference to the Firestore document to be deleted.
   * @returns The Firestore transaction after the delete operation has been added.
   */
  protected deleteWithTransactionFromRef(
    transaction: admin.firestore.Transaction,
    documentRef: admin.firestore.DocumentReference
  ): admin.firestore.Transaction {
    transaction.delete(documentRef)
    return transaction
  }

  /**
   * Deletes a document from Firestore using a provided batch and document reference.
   *
   * @param batch - The Firestore write batch to use for the delete operation.
   * @param documentRef - The reference to the document to be deleted.
   * @returns The updated Firestore write batch after the delete operation.
   */
  protected deleteWithBatchFromRef(
    batch: admin.firestore.WriteBatch,
    documentRef: admin.firestore.DocumentReference
  ): admin.firestore.WriteBatch {
    batch.delete(documentRef)
    return batch
  }
}
