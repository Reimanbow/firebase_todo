import "package:flutter_riverpod/flutter_riverpod.dart";

import "../ui/auth/view_model/auth_view_model.dart";

final authProvider = ChangeNotifierProvider((ref) {
  return AuthViewModel();
});
