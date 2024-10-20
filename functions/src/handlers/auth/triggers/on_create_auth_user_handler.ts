import * as functionsV1 from 'firebase-functions/v1'
import { AppState } from '../../../app_state'

/**
 * Handles the creation of a new authentication user.
 *
 * This function is triggered when a new user is created in the authentication system.
 * It creates a new user profile in the application's state.
 *
 * @param appState - The current state of the application, which includes services and other stateful information.
 * @param user - The user record from the authentication system.
 */
export async function onCreateAuthUserHandler(
  appState: AppState,
  user: functionsV1.auth.UserRecord
): Promise<void> {
  try {
    await appState.userService.createNewUserProfile(user.uid)
  } catch (error) {
    throw new functionsV1.https.HttpsError('internal', error.message)
  }
}
