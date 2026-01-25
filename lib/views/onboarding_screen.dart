import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentGeometry.center,
              child: Image.asset("assets/images/onboarding-background.png"),
            ),

            Align(
              alignment: Alignment(0, 0.3),
              child: Text(
                textAlign: TextAlign.center,
                "Welcome \nto our store",
                style: CustomTextStyle().xxLargeWhiteBoldText.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.45),
              child: Text(
                textAlign: TextAlign.center,
                "Ger your groceries in as fast as one hour",
                style: CustomTextStyle().xxLargeWhiteBoldText.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.7),
              child: CustomButton(onpressed: (){
                Navigator.pushReplacementNamed(context, "/login");
              }, text: "Get Started")
            ),
          ],
        ),
      ),
    );
  }
}
