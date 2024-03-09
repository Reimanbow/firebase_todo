import "package:flutter/foundation.dart";

import "../../../model/auth/auth_model.dart";

class AuthViewModel extends ChangeNotifier {
  AuthViewModel() {
    _model = AuthModel.app();
  }

  AuthViewModel.withModel(AuthModel model) {
    _model = model;
  }

  late AuthModel _model;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get isLogin => _model.currentUser() != null;

  Future<void> signInEmailAndPassword(String email, String password) async {
    try {
      await _model.signInEmailAndPassword(email, password);
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      await _model.signOut();
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}
