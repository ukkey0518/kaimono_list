import * as admin from 'firebase-admin'
import { UserShoppingList, UserShoppingListData } from '../models/user_shopping_list'
import { FirestoreModelRepository } from './firestore_model_repository'
import { FirestoreReference } from './firestore_reference'

/**
 * Repository class for managing user shopping lists in Firestore.
 *
 * This class extends the `FirestoreModelRepository` and implements the `FirestoreReference` interface
 * to provide methods for interacting with user shopping lists stored in Firestore. It includes methods
 * for creating, updating, deleting, and querying user shopping lists.
 */
export class UserShoppingListRepository
  extends FirestoreModelRepository<UserShoppingListData, UserShoppingList>
  implements FirestoreReference<UserShoppingListData>
{
  // * The dataConverter is overridden to add an `id` field to the Document.
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

  documentPath(userId: string, shoppingListId: string): string {
    return `${this.collectionPath(userId)}/${shoppingListId}`
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
    shoppingListId?: string
  ): admin.firestore.DocumentReference<UserShoppingListData> {
    return (
      shoppingListId
        ? this.firestore.doc(this.documentPath(userId, shoppingListId))
        : this.firestore.collection(this.collectionPath(userId)).doc()
    ).withConverter(this.dataConverter)
  }

  // ----------------------------------------------------------------------- //

  /**
   * Retrieves a list of user IDs associated with the specified shopping list ID.
   *
   * @param {string} shoppingListId - The ID of the shopping list.
   * @returns {Promise<string[]>} - A promise that resolves to an array of user IDs.
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
   * Creates a user shopping list document within a Firestore batch operation.
   *
   * @param batch - The Firestore WriteBatch instance to use for the batch operation.
   * @param userId - The ID of the user to whom the shopping list belongs.
   * @param shoppingList - The UserShoppingList object containing the shopping list data.
   * @returns The Firestore WriteBatch instance with the new operation added.
   */
  createWithBatch(
    batch: admin.firestore.WriteBatch,
    userId: string,
    shoppingList: UserShoppingList
  ): admin.firestore.WriteBatch {
    return this.createWithBatchFromRef(
      batch,
      this.documentRef(userId, shoppingList.id),
      shoppingList
    )
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
  updateWithBatch(
    batch: admin.firestore.WriteBatch,
    userId: string,
    shoppingListId: string,
    data: Partial<UserShoppingListData>
  ): admin.firestore.WriteBatch {
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
  deleteWithBatch(
    batch: admin.firestore.WriteBatch,
    userId: string,
    shoppingListId: string
  ): admin.firestore.WriteBatch {
    return this.deleteWithBatchFromRef(batch, this.documentRef(userId, shoppingListId))
  }
}
