import { Entity } from './entity'

export type UserShoppingList = Entity<UserShoppingListData>

export interface UserShoppingListData {
  orderIndex: number
  name: string
}
