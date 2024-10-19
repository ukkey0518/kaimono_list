import * as admin from 'firebase-admin'
import * as functionsV1 from 'firebase-functions/v1'
import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from './app_state'
import { onCreateAuthUserHandler } from './handlers/auth/triggers/on_create_auth_user_handler'
import { onDeleteAuthUserHandler } from './handlers/auth/triggers/on_delete_auth_user_handler'
import { createShoppingListHandler } from './handlers/shopping_list/apis/create_shopping_list'
import { onCreateShoppingListHandler } from './handlers/shopping_list/triggers/on_create_shopping_list_handler'
import { onDeleteShoppingListHandler } from './handlers/shopping_list/triggers/on_delete_shopping_list_handler'
import { onUpdateShoppingListHandler } from './handlers/shopping_list/triggers/on_update_shopping_list_handler'

functionsV2.setGlobalOptions({ region: 'asia-northeast1' })

const appState = new AppState(admin.initializeApp())

//
// Functions
//

const onCreateAuthUser = functionsV1
  .region('asia-northeast1')
  .auth.user()
  .onCreate(async user => await onCreateAuthUserHandler(appState, user))

const onDeleteAuthUser = functionsV1
  .region('asia-northeast1')
  .auth.user()
  .onDelete(async user => await onDeleteAuthUserHandler(appState, user))

const createShoppingList = functionsV2.https.onCall(async req => {
  await createShoppingListHandler(appState, req)
})

const onCreateShoppingList = functionsV2.firestore.onDocumentCreated(
  'shopping_lists/{shoppingListId}',
  async event => await onCreateShoppingListHandler(appState, event)
)

const onUpdateShoppingList = functionsV2.firestore.onDocumentUpdated(
  'shopping_lists/{shoppingListId}',
  async event => await onUpdateShoppingListHandler(appState, event)
)

const onDeleteShoppingList = functionsV2.firestore.onDocumentDeleted(
  'shopping_lists/{shoppingListId}',
  async event => await onDeleteShoppingListHandler(appState, event)
)

// ----------------------------------------------------------------------------

const auth = {
  triggers: {
    onCreateAuthUser,
    onDeleteAuthUser,
  },
}

const shoppingList = {
  apis: {
    createShoppingList,
  },
  triggers: {
    onCreateShoppingList,
    onUpdateShoppingList,
    onDeleteShoppingList,
  },
}

export { auth, shoppingList }
