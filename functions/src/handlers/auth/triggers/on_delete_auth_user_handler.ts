import * as functions from 'firebase-functions/v1'
import { AppState } from '../../../app_state'

export async function onDeleteAuthUserHandler(
  appState: AppState,
  context: functions.EventContext,
  userId: string
): Promise<void> {
  await appState.userService.setUserStatusToDeleted(userId)
}
