import * as functionsV2 from 'firebase-functions/v2'
import { AppState } from '../../../app_state'
import { ApiParams, ApiRequest } from '../../../constants/cloud_functions_types'

interface RequestParams extends ApiParams {
  name: string
}

interface ResponseParams extends ApiParams {
  shoppingListId: string
}

/**
 * Handles the creation of a new shopping list.
 *
 * @param appState - The current application state.
 * @param request - The API request containing authentication and data.
 * @returns A promise that resolves to an object containing the new shopping list ID.
 */
export async function createShoppingListHandler(
  appState: AppState,
  request: ApiRequest
): Promise<ResponseParams> {
  if (!request.auth) {
    throw new functionsV2.https.HttpsError('unauthenticated', 'User is not authenticated')
  }

  try {
    const { name } = request.data as RequestParams

    const newShoppingListId = await appState.shoppingListService.createShoppingList(
      request.auth.uid,
      name
    )

    return { shoppingListId: newShoppingListId }
  } catch (error) {
    throw new functionsV2.https.HttpsError('internal', error.message)
  }
}
