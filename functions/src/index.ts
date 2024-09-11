import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from './app_state'
import { onCreateAuthUserHandler } from './handlers/auth/triggers/on_create_auth_user_handler'
import { onDeleteAuthUserHandler } from './handlers/auth/triggers/on_delete_auth_user_handler'
import { onWriteShoppingListHandler } from './handlers/shopping_list/on_write_shopping_list_handler'

functionsV2.setGlobalOptions({ region: "asia-northeast1" });

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

const onWriteShoppingList = functionsV2.firestore.onDocumentWritten(
  'shopping_lists/{shoppingListId}',
  event => onWriteShoppingListHandler(appState, event.data?.before, event.data?.after)
)

// ----------------------------------------------------------------------------

const auth = {
  triggers: {
    onCreateAuthUser,
    onDeleteAuthUser,
  },
}

const shoppingList = {
  triggers: {
    onWriteShoppingList,
  },
}

export { auth, shoppingList }
