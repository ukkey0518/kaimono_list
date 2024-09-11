import * as functions from 'firebase-functions'
import { AppState } from '../../app_state'
import { ShoppingListData } from '../../models/shopping_list'

export async function onWriteShoppingListHandler(
  appState: AppState,
  context: functions.EventContext,
  change: functions.Change<functions.firestore.DocumentSnapshot>
): Promise<void> {
  const before = change.before.data() as ShoppingListData | undefined
  const after = change.after.data() as ShoppingListData | undefined

  const ownerUserId = after?.ownerUserId || before?.ownerUserId
  if (!ownerUserId) {
    // TODO: Add logging
    console.error('Shopping list does not have an owner user id')
    return
  }

  await appState.shoppingListService.syncShoppingListsWithUserSettings(ownerUserId!)
}
