import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/user_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  bool isvisable = true;
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .center,
                children: [
                  Image.asset("assets/images/second-logo.png", width: 100.w),
                ],
              ),

              Text("Sign Up", style: CustomTextStyle().xLargeBlackBoldText),
              SizedBox(height: 10.h),
              Text(
                "Enter your credentials to continue",
                style: CustomTextStyle().xsmallBlackText.copyWith(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 35.h),

              TextField(
                style: CustomTextStyle().xxsmallBlackBoldText,
                decoration: InputDecoration(
                  hintText: "Enter username",
                  hintStyle: CustomTextStyle().xxsmallBlackText.copyWith(
                    color: Colors.grey,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53B175)),
                  ),
                ),
              ),

              SizedBox(height: 35.h),

              TextField(
                controller: email,
                style: CustomTextStyle().xxsmallBlackBoldText,
                decoration: InputDecoration(
                  hintText: "Enter email address",
                  hintStyle: CustomTextStyle().xxsmallBlackText.copyWith(
                    color: Colors.grey,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53B175)),
                  ),
                ),
              ),

              SizedBox(height: 35.h),
             
              TextField(

                controller: password,
                obscureText: isvisable,
                style: CustomTextStyle().xxsmallBlackBoldText,
                decoration: InputDecoration(
                
                  hintText: "Enter password",
                  hintStyle: CustomTextStyle().xxsmallBlackText.copyWith(
                    color: Colors.grey,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53B175)),
                  ),

                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isvisable = !isvisable;
                      });
                    },
                    child: isvisable
                        ? Icon(Icons.visibility_off, color: Colors.grey)
                        : Icon(Icons.visibility, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "By continuing you agree to our Terms of Service\nand Privacy Policy",
                style: CustomTextStyle().xxsmallBlackText,
              ),
              SizedBox(height: 25.h),
              Center(
                child: userprovider.isloading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        onpressed: () async {
                          await userprovider.signupUser(
                            email.text.trim(),
                            password.text.trim(),
                          );
                          if (userprovider.errormessage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sign up successfully')),
                            );
                               Navigator.pushNamed(context, "/bottomNavigation");
                          } else {
                          
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(userprovider.errormessage!),
                              ),
                            );
                          }
                        },
                        text: "Sign Up",
                      ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: CustomTextStyle().xxsmallBlackBoldText,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text(
                      "Login",
                      style: CustomTextStyle().xxsmallBlackBoldText.copyWith(
                        color: Color(0xff53B175),
                      ),
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
