import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as logger from "firebase-functions/logger";
import { Timestamp } from "firebase-admin/firestore";

const firebaseFirestore = admin.firestore();

export const createTodo_v0 = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "failed-precondition",
        "The function must be called " + "while authenticated."
      );
    }

    const userId: string = data.uid;
    if (!(typeof userId === "string") || userId.length === 0) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "The function must be called with " +
          "argument \"uid\" containing the user id",
      );
    }

    const userDocRef = firebaseFirestore.collection('todos').doc(userId).collection('todos')

    userDocRef.get()
    final todosInRemote = await _getTodosAsFuture();

    final todosToSyncJson = <Map<String, dynamic>>[
      ...todosInRemote.map((e) => e.toJson()),
      todo.toJson(),
    ];

    await docRef.set({'todos': todosToSyncJson});

    final docRef = _queuesRef.doc(_userId)

    final queuesInRemote = await getQueues();

    final queueToSyncJson = [
      ...queuesInRemote.map((e) => e.toJson()),
      queue.toJson(),
    ];

    await docRef.set({'queues': queueToSyncJson});

    
  }
);
