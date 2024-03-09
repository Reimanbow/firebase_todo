import "package:firebase_auth/firebase_auth.dart";

class AuthModel {
  const AuthModel(this.instance);

  factory AuthModel.app() {
    return AuthModel(FirebaseAuth.instance);
  }

  final FirebaseAuth instance;

  Future<void> signInEmailAndPassword(String email, String password) async {
    try {
      await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      } else if (e.code == "wrong-password") {
        print("Wrong password provided for that user");
      }
    }
  }

  Future<void> signOut() async {
    await instance.signOut();
  }

  User? currentUser() {
    return instance.currentUser;
  }
}
