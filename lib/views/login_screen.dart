import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/user_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

              Text("Loging", style: CustomTextStyle().xLargeBlackBoldText),
              SizedBox(height: 10.h),
              Text(
                "Enter your emails and password",
                style: CustomTextStyle().xsmallBlackText.copyWith(
                  color: Colors.grey,
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

              SizedBox(height: 20.h),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: CustomTextStyle().xxsmallBlackText,
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Center(
                child: userprovider.isloading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        onpressed: () async {
                          await userprovider.loginUser(
                            email.text.trim(),
                            password.text.trim(),
                          );

                          if (userprovider.errormessage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login successfully')),
                            );
                            Navigator.pushReplacementNamed(context, "/home");
                          }else{
                             ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(userprovider.errormessage!)),
                            );
                          }
                        },
                        text: "Log In",
                      ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: CustomTextStyle().xxsmallBlackBoldText,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: Text(
                      "Signup",
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
