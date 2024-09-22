import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import { ShoppingList, ShoppingListData } from '../models/shopping_list'
import { FirestoreModelRepository } from './firestore_model_repository'
import { FirestoreReference } from './firestore_reference'

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

  fetch(shoppingListId: string): Promise<ShoppingList | undefined> {
    return this.fetchFromRef(this.documentRef(shoppingListId))
  }

  async listByOwnerUserId(ownerUserId: string): Promise<ShoppingList[]> {
    const qs = await this.firestore
      .collection(this.collectionPath())
      .where('ownerUserId', '==', ownerUserId)
      .get()
    return qs.docs.map(doc => ({
      id: doc.id,
      ...(doc.data() as ShoppingListData),
    }))
  }
}
