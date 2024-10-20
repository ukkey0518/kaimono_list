import * as admin from 'firebase-admin'
import * as functionsV1 from 'firebase-functions/v1'
import * as functionsV2 from 'firebase-functions/v2'

import { AppState } from './app_state'
import {
  ApiFunction,
  AuthTriggerFunction,
  TriggerFunction,
} from './constants/cloud_functions_types'
import { onCreateAuthUserHandler } from './handlers/auth/triggers/on_create_auth_user_handler'
import { onDeleteAuthUserHandler } from './handlers/auth/triggers/on_delete_auth_user_handler'
import { createShoppingListHandler } from './handlers/shopping_list/apis/create_shopping_list_handler'
import { onCreateShoppingListHandler } from './handlers/shopping_list/triggers/on_create_shopping_list_handler'
import { onDeleteShoppingListHandler } from './handlers/shopping_list/triggers/on_delete_shopping_list_handler'
import { onUpdateShoppingListHandler } from './handlers/shopping_list/triggers/on_update_shopping_list_handler'

// --- Initialization ------------------------------------------------------ //

functionsV2.setGlobalOptions({ region: 'asia-northeast1' })

const adminApp = admin.initializeApp()
const appState = new AppState(adminApp)

// --- Types --------------------------------------------------------------- //

interface FeatureFunctions {
  api?: {
    [key: string]: VersionedApiFunctions
  }
  trigger?: {
    [key: string]: AuthTriggerFunction | TriggerFunction
  }
}

type VersionedApiFunctions = {
  [key in `v${number}`]: ApiFunction
}

// --- Functions ----------------------------------------------------------- //

const auth: FeatureFunctions = {
  trigger: {
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

const shoppingList: FeatureFunctions = {
  api: {
    createShoppingList: {
      v1: functionsV2.https.onCall(async req => await createShoppingListHandler(appState, req)),
    },
  },
  trigger: {
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
