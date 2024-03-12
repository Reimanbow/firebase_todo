import "../../../model/todo/todo_model.dart";

class TodoViewModel {
  TodoViewModel(this._todo);

  final Todo _todo;

  Todo get todo => _todo;

  String get todoId => _todo.todoId;

  String get title => _todo.title;

  String get description => _todo.description;

  bool get isDone => _todo.isDone;

  void toggleIsDone() {
    _todo.toggleIsDone();
  }
}
