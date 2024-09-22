import * as admin from 'firebase-admin'
import { UserShoppingList, UserShoppingListData } from '../models/user_shopping_list'
import { FirestoreModelRepository } from './firestore_model_repository'

export class UserShoppingListRepository extends FirestoreModelRepository<
  UserShoppingListData,
  UserShoppingList
> {
  // * The dataConverter is overridden to add an id field to the Document.
  // * This is necessary for performing a CollectionGroup query to match the ShoppingListId.
  // * ref: https://github.com/firebase/firebase-admin-node/issues/587
  protected dataConverter: admin.firestore.FirestoreDataConverter<UserShoppingListData> = {
    fromFirestore: ds => ds.data() as UserShoppingListData,
    toFirestore: data => data,
  }

  //
  // --- Paths ---
  //

  collectionGroupId(): string {
    return `user_shopping_lists`
  }

  collectionPath(userId: string): string {
    return `/user_profiles/${userId}/${this.collectionGroupId()}`
  }

  documentPath(userId: string, userShoppingListId: string): string {
    return `${this.collectionPath(userId)}/${userShoppingListId}`
  }

  //
  // --- References ---
  //

  collectionGroupRef(): admin.firestore.CollectionGroup<UserShoppingListData> {
    return this.firestore
      .collectionGroup(this.collectionGroupId())
      .withConverter(this.dataConverter)
  }

  collectionRef(userId: string): admin.firestore.CollectionReference<UserShoppingListData> {
    return this.firestore.collection(this.collectionPath(userId)).withConverter(this.dataConverter)
  }

  documentRef(
    userId: string,
    userShoppingListId?: string
  ): admin.firestore.DocumentReference<UserShoppingListData> {
    return (
      userShoppingListId
        ? this.firestore.doc(this.documentPath(userId, userShoppingListId))
        : this.firestore.collection(this.collectionPath(userId)).doc()
    ).withConverter(this.dataConverter)
  }

  // ----------------------------------------------------------------------- //

  /**
   * Retrieves all user shopping lists associated with a specific shopping list ID.
   *
   * @param shoppingListId - The ID of the shopping list to query.
   * @returns A promise that resolves to an array of objects, each containing a userId and the corresponding userShoppingList.
   */
  async listUserIdsByShoppingListId(shoppingListId: string): Promise<string[]> {
    const qs = await this.collectionGroupRef().where('id', '==', shoppingListId).get()
    return qs.docs.map(doc => doc.ref.parent.parent!.id)
  }

  /**
   * Fetches the maximum order index for a user's shopping list.
   *
   * @param userId - The ID of the user whose shopping list's maximum order index is to be fetched.
   * @returns A promise that resolves to the maximum order index as a number, or undefined if the list is empty.
   */
  async fetchMaxOrderIndex(userId: string): Promise<number | undefined> {
    const qs = await this.collectionRef(userId).orderBy('orderIndex', 'desc').limit(1).get()
    if (qs.empty) return undefined
    return qs.docs[0].data().orderIndex ?? undefined
  }

  /**
   * Checks if a shopping list exists for a given user.
   *
   * @param userId - The ID of the user.
   * @param shoppingListId - The ID of the shopping list.
   * @returns A promise that resolves to a boolean indicating whether the shopping list exists.
   */
  async isExists(userId: string, shoppingListId: string): Promise<boolean> {
    return this.isExistsFromRef(this.documentRef(userId, shoppingListId))
  }

  /**
   * Creates a new user shopping list in the repository.
   *
   * @param userId - The unique identifier of the user.
   * @param userShoppingList - The shopping list object to be created.
   * @returns A promise that resolves when the creation is complete.
   */
  async create(userId: string, userShoppingList: UserShoppingList): Promise<void> {
    await this.createFromRef(this.documentRef(userId, userShoppingList.id), userShoppingList)
  }

  /**
   * Updates a user shopping list document within a Firestore batch operation.
   *
   * @param batch - The Firestore WriteBatch instance to use for the operation.
   * @param userId - The ID of the user who owns the shopping list.
   * @param shoppingListId - The ID of the shopping list to update.
   * @param data - A partial object containing the fields to update in the shopping list.
   * @returns A promise that resolves to the Firestore WriteBatch instance after the update operation is added.
   */
  async updateWithBatch(
    batch: admin.firestore.WriteBatch,
    userId: string,
    shoppingListId: string,
    data: Partial<UserShoppingListData>
  ): Promise<admin.firestore.WriteBatch> {
    return this.updateWithBatchFromRef(batch, this.documentRef(userId, shoppingListId), data)
  }

  /**
   * Deletes a shopping list document for a specific user within a Firestore batch operation.
   *
   * @param batch - The Firestore WriteBatch instance used to perform the batch operation.
   * @param userId - The ID of the user whose shopping list is to be deleted.
   * @param shoppingListId - The ID of the shopping list to be deleted.
   * @returns A promise that resolves to the Firestore WriteBatch instance after the delete operation is added to the batch.
   */
  async deleteWithBatch(
    batch: admin.firestore.WriteBatch,
    userId: string,
    shoppingListId: string
  ): Promise<admin.firestore.WriteBatch> {
    return this.deleteWithBatchFromRef(batch, this.documentRef(userId, shoppingListId))
  }

  /**
   * Deletes all user shopping lists associated with the given shopping list ID.
   *
   * @param shoppingListId - The ID of the shopping list to delete.
   * @returns A promise that resolves to an array of document references that were deleted.
   *
   * @remarks
   * This method retrieves all documents in the collection group that match the given shopping list ID,
   * and deletes them using a Firestore batch operation. Note that Firestore batch operations are limited
   * to 500 updates per batch. Ensure that the number of updates does not exceed this limit.
   *
   * @see {@link https://firebase.google.com/docs/firestore/manage-data/transactions#batched-writes | Firestore Batched Writes}
   */
  async deleteAllUsersShoppingLists(
    shoppingListId: string
  ): Promise<admin.firestore.DocumentReference[]> {
    const qs = await this.collectionGroupRef().where('id', '==', shoppingListId).get()

    // ? Is it better to take a WriteBatch instance as an argument?
    const batch = this.firestore.batch()
    // TODO(Ukkey): Ensure that the number of updates does not exceed 500
    //   - https://firebase.google.com/docs/firestore/manage-data/transactions#batched-writes
    //   - Limit the maximum number of list shares (e.g. 100)
    for (const doc of qs.docs) {
      this.deleteWithBatchFromRef(batch, doc.ref)
    }
    await batch.commit()

    return qs.docs.map(doc => doc.ref)
  }
}
