// FIXME 今後作成

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import '../../../provider/provider.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("sign out"),
          onPressed: () {
            final auth = ref.read(authProvider);
            auth.signOut();
          },
        ),
      ),
    );
  }
}
