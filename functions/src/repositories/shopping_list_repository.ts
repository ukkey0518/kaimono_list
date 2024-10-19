import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import { ShoppingList, ShoppingListData } from '../models/shopping_list'
import { FirestoreModelRepository } from './firestore_model_repository'
import { FirestoreReference } from './firestore_reference'

/**
 * Repository class for managing shopping lists in Firestore.
 *
 * This class extends the `FirestoreModelRepository` and implements the `FirestoreReference` interface
 * to provide methods for interacting with shopping lists stored in Firestore. It includes methods
 * for creating, updating, deleting, and querying shopping lists.
 */
export class ShoppingListRepository
  extends FirestoreModelRepository<ShoppingListData, ShoppingList>
  implements FirestoreReference<ShoppingListData>
{
  //
  // --- Paths ---
  //

  collectionGroupId(): string {
    return `shopping_lists`
  }

  collectionPath(): string {
    return `/${this.collectionGroupId()}`
  }

  documentPath(shoppingListId: string): string {
    return `${this.collectionPath()}/${shoppingListId}`
  }

  //
  // --- References ---
  //

  collectionGroupRef(): admin.firestore.CollectionGroup<ShoppingListData> {
    return this.firestore
      .collectionGroup(this.collectionGroupId())
      .withConverter(this.dataConverter)
  }

  collectionRef(): admin.firestore.CollectionReference<ShoppingListData> {
    return this.firestore.collection(this.collectionPath()).withConverter(this.dataConverter)
  }

  documentRef(shoppingListId?: string): admin.firestore.DocumentReference<ShoppingListData> {
    return (
      isNil(shoppingListId)
        ? this.firestore.collection(this.collectionPath()).doc()
        : this.firestore.doc(this.documentPath(shoppingListId))
    ).withConverter(this.dataConverter)
  }

  // ----------------------------------------------------------------------- //

  /**
   * Fetches a shopping list by its ID.
   *
   * @param shoppingListId - The unique identifier of the shopping list to fetch.
   * @returns A promise that resolves to the `ShoppingList` object if found, or `undefined` if not found.
   */
  fetch(shoppingListId: string): Promise<ShoppingList | undefined> {
    return this.fetchFromRef(this.documentRef(shoppingListId))
  }

  /**
   * Retrieves a list of shopping lists by the owner's user ID.
   *
   * @param userId - The ID of the user who owns the shopping lists.
   * @returns A promise that resolves to an array of `ShoppingList` objects.
   */
  async listByOwnerUserId(userId: string): Promise<ShoppingList[]> {
    const qs = await this.firestore
      .collection(this.collectionPath())
      .where('ownerUserId', '==', userId)
      .get()
    return qs.docs.map(doc => ({
      id: doc.id,
      ...(doc.data() as ShoppingListData),
    }))
  }

  /**
   * Adds a new shopping list item to the repository.
   *
   * @param data - The shopping list data to be added.
   * @returns A promise that resolves to the ID of the added shopping list item.
   */
  async add(data: ShoppingListData): Promise<string> {
    return this.addFromRef(this.collectionRef(), data)
  }

  /**
   * Checks if a document with the specified code exists in the collection.
   *
   * @param code - The code to search for in the collection.
   * @returns A promise that resolves to `true` if a document with the specified code exists, otherwise `false`.
   */
  async existsByCode(code: string): Promise<boolean> {
    const qs = await this.firestore
      .collection(this.collectionPath())
      .where('code', '==', code)
      .get()
    return !qs.empty
  }
}
