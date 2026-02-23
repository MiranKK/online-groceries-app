import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 25.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/grocery-cart.png", width: 80.w),
          Text(
            textAlign: TextAlign.center,
            "Welcome \nto our store",
            style: CustomTextStyle().xxLargeBlackBoldText.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.w900,
            ),
          ),

          Text(
            textAlign: TextAlign.center,
            "Ger your groceries in as fast as one hour",
            style: CustomTextStyle().xxLargeBlackBoldText.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w100,
            ),
          ),

          Center(
            child: CustomButton(
              onpressed: () {
                setState(() {
                  _isloading = true;
                });
                Navigator.pushReplacementNamed(context, "/login");
              },
              text: _isloading
                  ? CircularProgressIndicator(color: Colors.white)
                  : "Get Started",
            ),
          ),
        ],
      ),
    );
  }
}
