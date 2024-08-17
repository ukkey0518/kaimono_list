import { onDocumentCreated } from 'firebase-functions/v2/firestore'
import { onCreateItemFunction } from './on_create_item'
import { initializeApp } from 'firebase-admin/app'

initializeApp()

export const onCreateItem = onDocumentCreated(
  {
    document: 'items/{itemId}',
    region: 'asia-northeast1',
  },
  async event => {
    if (!event.data) {
      console.error('No data in event')
      return
    }
    onCreateItemFunction(event.data)
  }
)
