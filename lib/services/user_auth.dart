import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signupwithemail(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Sign up failed";
    } catch (e) {
      throw "Something went wrong $e";
    }
  }

  Future<User?> loginwithemail(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login failed";
    } catch (e) {
      throw "Something went wrong $e";
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      final result = await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Send reset password failed";
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Sign out failed";
      
    } catch (e) {
      throw "Something went wrong";
      
    }
  }
}
