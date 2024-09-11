import { ShoppingList, ShoppingListData } from '../models/shoppng_list'
import { FirestoreModelRepository } from './firestore_model_repository'

export class ShoppingListRepository extends FirestoreModelRepository<
  ShoppingListData,
  ShoppingList
> {
  collectionPath(): string {
    return '/shopping_lists'
  }
}
