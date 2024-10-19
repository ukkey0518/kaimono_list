import { Entity } from './entity'

export type ShoppingList = Entity<ShoppingListData>

/**
 * Represents the data structure for a shopping list.
 *
 * @interface ShoppingListData
 *
 * @property {string} code - The unique code of the shopping list.
 * @property {string} name - The name of the shopping list.
 * @property {string} ownerUserId - The user ID of the owner of the shopping list.
 */
export interface ShoppingListData {
  code: string
  name: string
  ownerUserId: string
}
