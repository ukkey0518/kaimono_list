import * as admin from 'firebase-admin'
import { ShoppingList, ShoppingListData } from '../models/shopping_list'
import { FirestoreModelRepository } from './firestore_model_repository'
import { isNil } from 'lodash'

export class ShoppingListRepository extends FirestoreModelRepository<
  ShoppingListData,
  ShoppingList
> {
  //
  // --- Paths ---
  //

  collectionPath(): string {
    return `/shopping_lists`
  }

  documentPath(shoppingListId: string): string {
    return `${this.collectionPath()}/${shoppingListId}`
  }

  //
  // --- References ---
  //

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
