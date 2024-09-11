import * as functions from 'firebase-functions'
import { AppState } from '../../app_state'
import { ShoppingListData } from '../../models/shopping_list'

export async function onWriteShoppingListHandler(
  appState: AppState,
  before: functions.firestore.DocumentSnapshot | undefined,
  after: functions.firestore.DocumentSnapshot | undefined,
): Promise<void> {
  const beforeData = before?.data() as ShoppingListData | undefined
  const afterData = after?.data() as ShoppingListData | undefined

  const ownerUserId = afterData?.ownerUserId || beforeData?.ownerUserId
  if (!ownerUserId) {
    // TODO: Add logging
    console.error('Shopping list does not have an owner user id')
    return
  }

  await appState.shoppingListService.syncShoppingListsWithUserSettings(ownerUserId!)
}
