import * as functionsV1 from 'firebase-functions/v1'
import { AppState } from '../../../app_state'

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
