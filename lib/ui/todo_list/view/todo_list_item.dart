import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../view_model/todo_view_model.dart";
import "../../../provider/provider.dart";

class TodoListItem extends ConsumerWidget {
  const TodoListItem({
    super.key,
    required this.todoViewModel,
  });

  final TodoViewModel todoViewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreProvider = ref.read(todoListProvider);
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        firestoreProvider.deleteTodo(todoViewModel.todo);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Delete"),
            Icon(Icons.delete),
          ],
        ),
      ),
      child: ListTile(
        leading: IconButton(
          icon: Icon(todoViewModel.isDone
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank),
          onPressed: () {},
        ),
        title: Text(
          todoViewModel.title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        // TODO タップ後の処理
        onTap: () {},
      ),
    );
  }
}
