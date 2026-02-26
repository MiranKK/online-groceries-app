import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/user_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Row(
            spacing: 4.w,
            children: [
              Image.asset("assets/images/profile-img.png", width: 80.w),

              Column(
                children: [
                  Text(
                    "Miran Kawa",
                    style: CustomTextStyle().xsmallBlackBoldText,
                  ),
                  Text(
                    "mirankawa93@gmail.com",
                    style: CustomTextStyle().xxsmallBlackBoldText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Container(
            height: 600,
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                
                ),
              );
            },),
          ),
          Center(
            child: TextButton(
              onPressed: () async {
                await userprovider.signout();
                if (userprovider.errormessage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Sign out successfully")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(userprovider.errormessage!)),
                  );
                }
              },
              child: const Text("Sign out"),
            ),
          ),
        ],
      ),
    );
  }
}
