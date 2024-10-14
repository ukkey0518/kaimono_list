import { Entity } from './entity'

export type UserShoppingList = Entity<UserShoppingListData>

/**
 * Represents the data structure for a user shopping list.
 *
 * @property {number} orderIndex - The order index of the shopping list.
 * @property {string} name - The name of the shopping list.
 * @property {string} ownerUserId - The user ID of the owner of the shopping list.
 *
 * * In order to realise an ID search using a CollectionGroup query,
 * * the `id` field is stored in the Document of the Firestore.
 * * ref: https://github.com/firebase/firebase-admin-node/issues/587
 */
export interface UserShoppingListData {
  orderIndex: number
  name: string
  ownerUserId: string
}
