import * as admin from 'firebase-admin'
import { isNil } from 'lodash'
import { AppFirestoreModel } from './app_firestore_model'

export abstract class AppFirestoreModelRepository<T extends AppFirestoreModel> {
  constructor(private firestore: admin.firestore.Firestore) {}

  //
  // --- Paths ---
  //

  abstract collectionPath(): string

  documentPath(id: string): string {
    return `${this.collectionPath()}/${id}`
  }

  //
  // --- References ---
  //

  collectionRef(): admin.firestore.CollectionReference<T> {
    return this.firestore.collection(this.collectionPath()).withConverter(this.dataConverter)
  }

  documentRef(id?: string): admin.firestore.DocumentReference<T> {
    return (
      isNil(id)
        ? this.firestore.collection(this.collectionPath()).doc()
        : this.firestore.doc(this.documentPath(id))
    ).withConverter(this.dataConverter)
  }

  //
  // --- Data Converter ---
  //

  dataConverter: admin.firestore.FirestoreDataConverter<T> = {
    fromFirestore: ds =>
      ({
        id: ds.id,
        ...ds.data(),
      }) as T,
    toFirestore: data => {
      delete data.id
      return data
    },
  }
}
