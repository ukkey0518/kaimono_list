import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from '../../../app_state'

/**
 * Handles the creation of a new shopping list.
 *
 * This function is triggered when a new shopping list document is created in Firestore.
 * It creates a user shopping list for the owner of the shopping list.
 *
 * @param appState - The current application state, which includes services and other utilities.
 * @param ds - The Firestore document snapshot of the newly created shopping list.
 * @returns A promise that resolves when the user shopping list has been successfully created.
 */
export async function onCreateShoppingListHandler(
  appState: AppState,
  event: functionsV2.firestore.FirestoreEvent<
    functionsV2.firestore.QueryDocumentSnapshot | undefined
  >
): Promise<void> {
  try {
    const ds = event.data
    if (!ds) {
      // TODO: Implement custom logger
      console.error('Shopping list document snapshot is undefined')
      return
    }

    // Create a user shopping list for the owner of the shopping list
    await appState.shoppingListService.createUserShoppingList(ds.id)
  } catch (error) {
    throw new functionsV2.https.HttpsError('internal', error.message)
  }
}
