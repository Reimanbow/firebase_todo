import "package:flutter/foundation.dart";

import "../../../model/firestore/firestore_model.dart";
import "../../../model/todo/todo_model.dart";

class TodoCreateViewModel extends ChangeNotifier {
  TodoCreateViewModel() {
    _firestoreModel = FirestoreModel.app();
  }

  TodoCreateViewModel.withModel(FirestoreModel firestoreModel) {
    _firestoreModel = firestoreModel;
  }

  late FirestoreModel _firestoreModel;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> setData(String todoId, String title, String description) async {
    Todo todo = Todo(todoId, title, description, false);
    _firestoreModel.setData(todo);
  }
}
