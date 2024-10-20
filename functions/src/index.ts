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

const adminApp = admin.initializeApp()
const appState = new AppState(adminApp)

const auth = {
  triggers: {
    onCreateAuthUser: functionsV1
      .region('asia-northeast1')
      .auth.user()
      .onCreate(async user => await onCreateAuthUserHandler(appState, user)),
    onDeleteAuthUser: functionsV1
      .region('asia-northeast1')
      .auth.user()
      .onDelete(async user => await onDeleteAuthUserHandler(appState, user)),
  },
}

const shoppingList = {
  apis: {
    createShoppingList: functionsV2.https.onCall(
      async req => await createShoppingListHandler(appState, req)
    ),
  },
  triggers: {
    onCreateShoppingList: functionsV2.firestore.onDocumentCreated(
      'shopping_lists/{shoppingListId}',
      async event => await onCreateShoppingListHandler(appState, event)
    ),
    onUpdateShoppingList: functionsV2.firestore.onDocumentUpdated(
      'shopping_lists/{shoppingListId}',
      async event => await onUpdateShoppingListHandler(appState, event)
    ),
    onDeleteShoppingList: functionsV2.firestore.onDocumentDeleted(
      'shopping_lists/{shoppingListId}',
      async event => await onDeleteShoppingListHandler(appState, event)
    ),
  },
}

export { auth, shoppingList }
