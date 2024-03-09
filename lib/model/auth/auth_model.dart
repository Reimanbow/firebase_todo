import "package:firebase_auth/firebase_auth.dart";

class AuthModel {
  const AuthModel(this.instance);

  factory AuthModel.app() {
    return AuthModel(FirebaseAuth.instance);
  }

  final FirebaseAuth instance;

  Future<void> signInEmailAndPassword(String email, String password) async {
    await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await instance.signOut();
  }

  User? currentUser() {
    return instance.currentUser;
  }
}
