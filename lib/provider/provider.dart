import "package:flutter_riverpod/flutter_riverpod.dart";

import "../ui/auth/view_model/auth_view_model.dart";
import "../ui/todo_list/view_model/todo_list_view_model.dart";
import "../ui/todo_create/view_model/todo_create_view_model.dart";

final authProvider = ChangeNotifierProvider((ref) {
  return AuthViewModel();
});

final todoListProvider = ChangeNotifierProvider((ref) {
  final todoListViewModel = TodoListViewModel();
  todoListViewModel.getAllData();
  return todoListViewModel;
});

final todoCreateProvider = ChangeNotifierProvider((ref) {
  return TodoCreateViewModel();
});
