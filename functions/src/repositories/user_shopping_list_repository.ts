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
   * Updates all user shopping lists that match the given shopping list ID with the provided data.
   *
   * @param shoppingListId - The ID of the shopping list to update.
   * @param data - Partial data to update in the user shopping lists.
   * @returns A promise that resolves to an array of document references that were updated.
   *
   * @remarks
   * This method uses a Firestore batch to perform the updates. Note that Firestore batches have a limit of 500 operations.
   * Ensure that the number of updates does not exceed this limit. Consider limiting the maximum number of list shares (e.g., 100).
   *
   * @see {@link https://firebase.google.com/docs/firestore/manage-data/transactions#batched-writes}
   */
  async updateAllUsersShoppingLists(
    shoppingListId: string,
    data: Partial<UserShoppingListData>
  ): Promise<admin.firestore.DocumentReference[]> {
    const qs = await this.collectionGroupRef().where('id', '==', shoppingListId).get()

    // ? Is it better to take a WriteBatch instance as an argument?
    const batch = this.firestore.batch()
    // TODO(Ukkey): Ensure that the number of updates does not exceed 500
    //   - https://firebase.google.com/docs/firestore/manage-data/transactions#batched-writes
    //   - Limit the maximum number of list shares (e.g. 100)
    for (const doc of qs.docs) {
      this.updateWithBatchFromRef(batch, doc.ref, data)
    }
    await batch.commit()

    return qs.docs.map(doc => doc.ref)
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
