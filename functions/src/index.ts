import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from './app_state'
import { onCreateAuthUserHandler } from './handlers/auth/triggers/on_create_auth_user_handler'
import { onDeleteAuthUserHandler } from './handlers/auth/triggers/on_delete_auth_user_handler'
import { onCreateShoppingListHandler } from './handlers/shopping_list/on_create_shopping_list_handler'
import { onDeleteShoppingListHandler } from './handlers/shopping_list/on_delete_shopping_list_handler'
import { onUpdateShoppingListHandler } from './handlers/shopping_list/on_update_shopping_list_handler'

functionsV2.setGlobalOptions({ region: 'asia-northeast1' })

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

const onCreateShoppingList = functionsV2.firestore.onDocumentCreated(
  'shopping_lists/{shoppingListId}',
  async event => await onCreateShoppingListHandler(appState, event.data)
)

const onUpdateShoppingList = functionsV2.firestore.onDocumentUpdated(
  'shopping_lists/{shoppingListId}',
  async event => await onUpdateShoppingListHandler(appState, event.data)
)

const onDeleteShoppingList = functionsV2.firestore.onDocumentDeleted(
  'shopping_lists/{shoppingListId}',
  async event => await onDeleteShoppingListHandler(appState, event.data)
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
    onCreateShoppingList,
    onUpdateShoppingList,
    onDeleteShoppingList,
  },
}

export { auth, shoppingList }
