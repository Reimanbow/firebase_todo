import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../view_model/todo_view_model.dart";
import "../../../provider/provider.dart";
import "todo_description_page.dart";

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("deleted ${todoViewModel.title}"),
          ),
        );
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
          // isDoneのトグル
          onPressed: () {
            todoViewModel.toggleIsDone();
            firestoreProvider.updateIsDone(todoViewModel.todo);
          },
        ),
        title: Text(
          todoViewModel.title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        // タップしたらTodoの詳細を表示する
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TodoDescriptionPage(
                title: todoViewModel.title,
                description: todoViewModel.description,
                isDone: todoViewModel.isDone,
              ),
            ),
          );
        },
      ),
    );
  }
}
