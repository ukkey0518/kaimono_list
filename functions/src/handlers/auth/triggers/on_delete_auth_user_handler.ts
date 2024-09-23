import * as functions from 'firebase-functions/v1'
import { AppState } from '../../../app_state'

export async function onDeleteAuthUserHandler(
  appState: AppState,
  user: functions.auth.UserRecord
): Promise<void> {
  await appState.userService.setUserStatusToDeleted(user.uid)
}
