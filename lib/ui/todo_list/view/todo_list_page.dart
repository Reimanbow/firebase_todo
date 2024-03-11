import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import '../../../provider/provider.dart';
import "../view_model/todo_view_model.dart";
import "todo_list_item.dart";
import "../../todo_create/view/todo_create_page.dart";

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreProvider = ref.watch(todoListProvider);
    final todoList = firestoreProvider.todoData;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          ElevatedButton(
            child: const Text("create todo"),
            // 作成ページに移動する
            onPressed: () async {
              await Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (context) => const TodoCreatePage(),
                ),
              );

              if (!context.mounted) {
                return;
              }

              await ref.read(todoListProvider).refresh();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            child: const Text("sign out"),
            onPressed: () {
              final auth = ref.read(authProvider);
              auth.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoListItem(
              todoViewModel: TodoViewModel(todoList[index]),
            );
          },
        ),
      ),
    );
  }
}
