import * as functions from 'firebase-functions'
import { appState } from '..'

export const onCreateAuthUser = functions.auth.user().onCreate(async user => {
  await appState.userService.createEmptyUserProfile(user.uid)
})
