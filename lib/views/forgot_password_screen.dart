import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/user_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/second-logo.png")),
              SizedBox(height: 20.h),
              Text(
                "Forgot Password",
                style: CustomTextStyle().xLargeBlackBoldText,
              ),
              SizedBox(height: 10.h),
              Text(
                "Enter email to send reset the password",
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

              Center(
                child:userprovider.isloading?CircularProgressIndicator(): CustomButton(
                  onpressed: () async {
                    await userprovider.resetPass(email.text);
                    if (userprovider.errormessage == null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Reset email sent")));
                
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(userprovider.errormessage!)),
                      );
                    }
                  },
                  text: "Send Reset Password",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
