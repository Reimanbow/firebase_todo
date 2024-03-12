import "package:cloud_firestore/cloud_firestore.dart";

class Todo {
  final String _todoId;
  String get todoId => _todoId;

  final String _title;
  String get title => _title;

  final String _description;
  String get description => _description;

  bool _isDone;
  bool get isDone => _isDone;

  void toggleIsDone() {
    _isDone = !_isDone;
  }

  Todo(
    this._todoId,
    this._title,
    this._description,
    this._isDone,
  );

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Todo(
      data?["todoId"],
      data?["title"],
      data?["description"],
      data?["isDone"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "todoId": _todoId,
      "title": _title,
      "description": _description,
      "isDone": _isDone,
    };
  }
}
