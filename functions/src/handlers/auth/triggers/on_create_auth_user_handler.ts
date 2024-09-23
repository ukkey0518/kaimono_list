import * as functions from 'firebase-functions/v1'
import { AppState } from '../../../app_state'

export async function onCreateAuthUserHandler(
  appState: AppState,
  user: functions.auth.UserRecord
): Promise<void> {
  await appState.userService.createNewUserProfile(user.uid)
}
