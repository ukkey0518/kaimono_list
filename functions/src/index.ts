import * as admin from 'firebase-admin'
import { AppState } from './app_state'
import { onCreateAuthUser } from './controllers/on_create_auth_user_controller'

export const appState = new AppState(admin.initializeApp())

export { auth }

const auth = {
  onCreateAuthUser,
}
