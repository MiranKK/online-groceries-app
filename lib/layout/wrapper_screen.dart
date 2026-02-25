import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/layout/bottom_navigation_layout.dart';
import 'package:online_groceries_app_ui/services/user_auth.dart';
import 'package:online_groceries_app_ui/views/login_screen.dart';
import 'package:online_groceries_app_ui/views/splash_screen.dart';

class WrapperScreen extends StatelessWidget {
  WrapperScreen({super.key});
  final UserAuth _userAuth = UserAuth();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _userAuth.authStateChanges,
      builder: (context, snapshot) {
          print("Auth state: ${snapshot.data}"); 
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }
        if (snapshot.hasData) {
          return const BottomNavigationLayout();
        }

        return LoginScreen();
      },
    );
  }
}
