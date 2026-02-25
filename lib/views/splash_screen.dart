import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
     if(mounted){
       Navigator.pushNamed(context, "/onboardingScreen");
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff53b175),
        child: Center(
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Image.asset("assets/images/logo.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("nectar", style: CustomTextStyle().xxLargeWhiteBoldText),
                  Text(
                    "Online Groceries",
                    style: CustomTextStyle().xxsmallWhiteText.copyWith(
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
