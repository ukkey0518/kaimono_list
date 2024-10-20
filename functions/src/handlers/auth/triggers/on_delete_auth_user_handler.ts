import * as functionsV1 from 'firebase-functions/v1'
import { AppState } from '../../../app_state'

/**
 * Handles the deletion of an authenticated user.
 *
 * This function is triggered when an authenticated user is deleted. It updates the user's status
 * to "deleted" in the application state.
 *
 * @param appState - The current state of the application.
 * @param user - The user record of the deleted user.
 */
export async function onDeleteAuthUserHandler(
  appState: AppState,
  user: functionsV1.auth.UserRecord
): Promise<void> {
  try {
    await appState.userService.setUserStatusToDeleted(user.uid)
  } catch (error) {
    throw new functionsV1.https.HttpsError('internal', error.message)
  }
}
