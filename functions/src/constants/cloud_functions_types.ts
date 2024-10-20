import * as functionsV1 from 'firebase-functions/v1'
import * as functionsV2 from 'firebase-functions/v2'

// --- API ----------------------------------------------------------------- //

/**
 * Represents a collection of API parameters where each key is a string and the value can be of any type.
 */
export interface ApiParams {
  [key: string]: unknown
}

/**
 * Represents a callable HTTP function for the API.
 */
export type ApiFunction = functionsV2.https.CallableFunction<ApiParams, Promise<ApiParams | void>>

/**
 * Represents an API request in the cloud functions.
 *
 * This type is used to define the structure of a callable request
 * that includes the parameters of type `ApiParams`.
 */
export type ApiRequest = functionsV2.https.CallableRequest<ApiParams>

// --- Triggers ------------------------------------------------------------ //

export type AuthTriggerFunction = functionsV1.CloudFunction<functionsV1.auth.UserRecord>

export type TriggerFunction = functionsV2.CloudFunction<
  FirestoreSnapshotEvent | FirestoreChangeEvent
>

// --- FirestoreEvent ------------------------------------------------------- //

export type FirestoreSnapshotEvent = functionsV2.firestore.FirestoreEvent<
  functionsV2.firestore.QueryDocumentSnapshot | undefined,
  ApiParams
>

export type FirestoreChangeEvent = functionsV2.firestore.FirestoreEvent<
  functionsV2.firestore.Change<functionsV2.firestore.QueryDocumentSnapshot> | undefined,
  ApiParams
>
