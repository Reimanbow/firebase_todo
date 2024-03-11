import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import '../../../provider/provider.dart';
import "../view_model/todo_view_model.dart";
import "todo_list_item.dart";

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            //TODO 作成ページに移動する
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                child: const Text("sign out"),
                onPressed: () {
                  final auth = ref.read(authProvider);
                  auth.signOut();
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer(
          builder: (context, ref, child) {
            final firestoreProvider = ref.watch(todoListProvider);
            final todoList = firestoreProvider.todoData;
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return TodoListItem(
                  todoViewModel: TodoViewModel(todoList[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
