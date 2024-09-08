import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { AppState } from './app_state'
import { onCreateAuthUserHandler } from './handlers/on_create_auth_user_handler'
import { onDeleteAuthUserHandler } from './handlers/on_delete_auth_user_handler'

const appState = new AppState(admin.initializeApp())

//
// Functions
//

const onCreateAuthUser = functions
  .region('asia-northeast1')
  .auth.user()
  .onCreate(async (user, context) => await onCreateAuthUserHandler(appState, context, user.uid))

const onDeleteAuthUser = functions
  .region('asia-northeast1')
  .auth.user()
  .onDelete(async (user, context) => await onDeleteAuthUserHandler(appState, context, user.uid))  

// ----------------------------------------------------------------------------

const auth = {
  triggers: {
    onCreateAuthUser,
    onDeleteAuthUser,
  },
}

export { auth }
