import { Entity } from './entity'

export type ShoppingList = Entity<ShoppingListData>

export interface ShoppingListData {
  name: string
  ownerUserId: string
}
