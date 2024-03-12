import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/foundation.dart";

import "../../../model/firestore/firestore_model.dart";
import "../../../model/todo/todo_model.dart";

class TodoListViewModel extends ChangeNotifier {
  TodoListViewModel() {
    _model = FirestoreModel.app();
  }

  TodoListViewModel.withModel(FirestoreModel model) {
    _model = model;
  }

  late FirestoreModel _model;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<Todo> _todoData = [];
  List<Todo> get todoData => _todoData;

  Future<void> getAllData() async {
    _todoData.clear();
    QuerySnapshot<Todo> snapshot;
    try {
      snapshot = await _model.getAllData();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return;
    }

    for (var docSnapshot in snapshot.docs) {
      _todoData.add(docSnapshot.data());
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    _errorMessage = null;
    await getAllData();
    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    _model.deleteData(todo.todoId);
    _todoData.remove(todo);
    notifyListeners();
  }

  Future<void> updateIsDone(Todo todo) async {
    _todoData[_todoData.indexOf(todo)] = todo;
    _model.updateIsDone(todo.todoId, todo.isDone);
    notifyListeners();
  }
}
