import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/views/login_screen.dart';
import 'package:online_groceries_app_ui/views/onboarding_screen.dart';
import 'package:online_groceries_app_ui/views/signup_screen.dart';
import 'package:online_groceries_app_ui/views/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Gilroy",
          ),
          title: 'Online Groceries App',
          initialRoute: "/",
          routes: {
            "/": (context) => SplashScreen(),
            "/onboardingScreen": (context) => OnboardingScreen(),
            "/signup": (context) => SignupScreen(),
            "/login": (context) => LoginScreen(),
          },
        );
      },
    );
  }
}
