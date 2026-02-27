import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/user_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_profile_list.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          children: [
            Row(
              spacing: 8.w,
              children: [
                Image.asset("assets/images/profile-img.png", width: 50.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

            SizedBox(
              height: 450.h,
              child: ListView(
                children: [
                  const CustomProfileList(
                    title: "Orders",
                    icon: Icons.shopping_bag_outlined,
                  ),
                  const CustomProfileList(
                    title: "My Details",
                    icon: Icons.card_membership_outlined,
                  ),
                  const CustomProfileList(
                    title: "Delivery",
                    icon: Icons.location_on_outlined,
                  ),
                  const CustomProfileList(
                    title: "Payment Methods",
                    icon: Icons.credit_card_outlined,
                  ),
                  const CustomProfileList(
                    title: "Promo Card",
                    icon: Icons.sell_outlined,
                  ),
                  const CustomProfileList(
                    title: "Notfication",
                    icon: Icons.notifications,
                  ),
                  const CustomProfileList(
                    title: "Help",
                    icon: Icons.help_outline,
                  ),
                  const CustomProfileList(
                    title: "About",
                    icon: Icons.info_outline,
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  minimumSize: Size(250.w, 45.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
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
                child: Text(
                  "Sign out",
                  style: CustomTextStyle().xxsmallBlackBoldText.copyWith(
                    color: const Color(0xff53B175),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
