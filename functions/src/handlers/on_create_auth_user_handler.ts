import { AppState } from '../app_state'

export async function onCreateAuthUserHandler(appState: AppState, id: string): Promise<void> {
  await appState.userService.createEmptyUserProfile(id)
}
