import { ShoppingList, ShoppingListData } from '../models/shopping_list'
import { FirestoreModelRepository } from './firestore_model_repository'

export class ShoppingListRepository extends FirestoreModelRepository<
  ShoppingListData,
  ShoppingList
> {
  collectionPath(): string {
    return '/shopping_lists'
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
