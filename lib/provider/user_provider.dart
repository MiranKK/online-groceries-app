import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/services/user_auth.dart';

class UserProvider extends ChangeNotifier {
  final UserAuth _userAuth = UserAuth();
  String? errormessage;
  bool isloading = false;

  Future<void> signupUser(String email, String password) async {
    errormessage = null;
    isloading = true;
    notifyListeners();

    try {
      await _userAuth.signupwithemail(email, password);
    } catch (e) {
      errormessage = e.toString();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> loginUser(String email, String password) async {
    errormessage = null;
    isloading = true;
    notifyListeners();

    try {
      await _userAuth.loginwithemail(email, password);
    } catch (e) {
      errormessage = e.toString();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> resetPass(String email) async {
    errormessage = null;
    isloading = true;
    notifyListeners();
    try {
      await _userAuth.resetPassword(email.trim());
    } catch (e) {
      errormessage = e.toString();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> signout() async {
    errormessage = null;
    isloading = true;
    notifyListeners();
    try {
      await _userAuth.logout();
    } catch (e) {
      errormessage = e.toString();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
