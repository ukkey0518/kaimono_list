import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from '../../../app_state'

interface Params {
  name: string
}

interface Response {
  shoppingListId: string
}

export async function createShoppingListHandler(
  appState: AppState,
  request: functionsV2.https.CallableRequest<Params>
): Promise<Response> {
  if (!request.auth) {
    throw new functionsV2.https.HttpsError('unauthenticated', 'User is not authenticated')
  }

  try {
    const { name } = request.data

    const newShoppingListId = await appState.shoppingListService.createShoppingList(
      request.auth.uid,
      name
    )

    return { shoppingListId: newShoppingListId }
  } catch (error) {
    throw new functionsV2.https.HttpsError('internal', error.message)
  }
}
