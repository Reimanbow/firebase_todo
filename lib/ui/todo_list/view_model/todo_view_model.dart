import "../../../model/todo/todo_model.dart";

class TodoViewModel {
  TodoViewModel();

  Todo? _todo;

  void setTodo(Todo todo) {
    _todo = todo;
  }

  Todo? get todo => _todo;

  String get todoId => _todo!.todoId;

  String get title => _todo!.title;

  String get description => _todo!.description;

  bool get isDone => _todo!.isDone;

  DateTime get dueDateTime => _todo!.dueDateTime;

  DateTime get createdDateTime => _todo!.createdDateTime;
}
