import { QueryDocumentSnapshot } from "firebase-functions/v2/firestore";

export function onCreateItemFunction(ds: QueryDocumentSnapshot) {
  const id = ds.id;
//   const data = ds.data();

  console.log(`Item created with ID: ${id}`);
}
