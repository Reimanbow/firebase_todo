import "package:cloud_firestore/cloud_firestore.dart";

class Todo {
  final String _todoId;
  String get todoId => _todoId;

  final String _title;
  String get title => _title;

  final String _description;
  String get description => _description;

  final bool _isDone;
  bool get isDone => _isDone;

  final DateTime _dueDateTime;
  DateTime get dueDateTime => _dueDateTime;

  final DateTime _createdDateTime;
  DateTime get createdDateTime => _createdDateTime;

  const Todo(
    this._todoId,
    this._title,
    this._description,
    this._isDone,
    this._dueDateTime,
    this._createdDateTime,
  );

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Todo(
      data?["todoId"],
      data?["title"],
      data?["description"],
      data?["isDone"],
      data?["dueDateTime"],
      data?["createdDateTime"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "todoId": _todoId,
      "title": _title,
      "description": _description,
      "isDone": _isDone,
      "dueDateTime": _dueDateTime,
      "createdDateTime": _createdDateTime,
    };
  }
}
