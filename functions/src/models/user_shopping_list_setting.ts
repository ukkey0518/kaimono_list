import { Entity } from "./entity"

export type UserShoppingListSetting = Entity<UserShoppingListSettingData>

export interface UserShoppingListSettingData {
  userShoppingLists: UserShoppingListData[]
}

export interface UserShoppingListData {
  id: string
  name: string
}
