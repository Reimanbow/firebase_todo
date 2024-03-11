import "package:cloud_firestore/cloud_firestore.dart";

import "../todo/todo_model.dart";

class FirestoreModel {
  const FirestoreModel(this.instance);

  factory FirestoreModel.app() {
    return FirestoreModel(FirebaseFirestore.instance);
  }

  final FirebaseFirestore instance;

  Future<void> setData(Todo data) async {
    await instance
        .collection("todo")
        .withConverter(
          fromFirestore: Todo.fromFirestore,
          toFirestore: (Todo todo, options) => todo.toFirestore(),
        )
        .doc(data.todoId)
        .set(data);
  }

  Future<QuerySnapshot<Todo>> getAllData() async {
    return await instance
        .collection("todo")
        .withConverter(
          fromFirestore: Todo.fromFirestore,
          toFirestore: (Todo todo, options) => todo.toFirestore(),
        )
        .get();
  }

  Future<void> deleteData(String id) async {
    await instance.collection("todo").doc(id).delete();
  }
}
