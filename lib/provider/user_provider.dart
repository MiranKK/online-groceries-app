import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/services/user_auth.dart';

class UserProvider extends ChangeNotifier {
  final UserAuth _userAuth = UserAuth();
  String? errormessage;
  bool isloading = false;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isvisable = true;

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

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty) return "Name is required";
    return null;
  }

  String? emailValidate(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!value.contains("@")) return "Enter valid email";
    return null;
  }

  String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must greater than 6 character";
    return null;
  }

  void isVisable() {
    isvisable = !isvisable;
    notifyListeners();
  }

  void submit() {
    print(name.text);
    print(email.text);
    print(password.text);
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
