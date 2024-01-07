import 'package:fastride/domain/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEmailAuth {
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  static String get userName => FirebaseAuth.instance.currentUser!.displayName!;
  static User? get user => FirebaseAuth.instance.currentUser;
  static String get email => FirebaseAuth.instance.currentUser!.email!;

  Future<String> createAccount({required UserModel userModel}) async {
    try {
      UserCredential? userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(userModel.fullName);
        await user.reload();
        user = firebaseAuth.currentUser;
        return "User created";
      } else {
        return "Something Went Wrong";
      }
    } on FirebaseAuthException catch (error) {
      return error.message!;
    }
  }

  Future<String> loginUserAccount({required UserModel userModel}) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailLink(
        email: userModel.email,
        emailLink: userModel.password,
      );
      User? user = userCredential.user;
      if (user != null) {
        return "Login successful";
      } else {
        return "Something Went Wrong";
      }
    } on FirebaseAuthException catch (error) {
      return error.message!;
    }
  }
}
