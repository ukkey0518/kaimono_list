import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from '../../../app_state'
import { FirestoreChangeEvent } from '../../../constants/cloud_functions_types'
import { ShoppingListData } from '../../../models/shopping_list'

/**
 * Handles the update event for a shopping list in Firestore.
 *
 * @param appState - The current application state.
 * @param event - The Firestore change event containing the before and after snapshots.
 */
export async function onUpdateShoppingListHandler(
  appState: AppState,
  event: FirestoreChangeEvent
): Promise<void> {
  try {
    if (!event.data) {
      // TODO: Implement custom logger
      console.error('Shopping list document snapshot is undefined')
      return
    }

    const change = event.data

    const beforeData = change.before.data() as ShoppingListData

    // Synchronize the shopping list to all users
    await appState.shoppingListService.syncAllUsersShoppingLists(
      change.after.id,
      beforeData.ownerUserId
    )
  } catch (error) {
    throw new functionsV2.https.HttpsError('internal', error.message)
  }
}
