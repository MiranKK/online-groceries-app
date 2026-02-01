import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/user_provider.dart';
import 'package:online_groceries_app_ui/views/home_screen.dart';
import 'package:online_groceries_app_ui/views/login_screen.dart';
import 'package:online_groceries_app_ui/views/onboarding_screen.dart';
import 'package:online_groceries_app_ui/views/signup_screen.dart';
import 'package:online_groceries_app_ui/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBAQ6EGRttYVJvzYXFslQD0utCqurMK3BA",
      authDomain: "online-groceries-app-2b054.firebaseapp.com",
      projectId: "online-groceries-app-2b054",
      storageBucket: "online-groceries-app-2b054.firebasestorage.app",
      messagingSenderId: "832547844633",
      appId: "1:832547844633:web:5e7071349d002c3c743088",
      measurementId: "G-YR6D77Q77T",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

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
            "/home": (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
