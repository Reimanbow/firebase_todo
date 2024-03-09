import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../provider/provider.dart";
import "signin_page.dart";
import "../todo_list/view/todo_list_page.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final auth = ref.watch(authProvider);
        return auth.isLogin ? const TodoListPage() : const SignInPage();
      },
    );
  }
}
