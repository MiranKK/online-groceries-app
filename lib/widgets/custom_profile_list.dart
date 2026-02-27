import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';

class CustomProfileList extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomProfileList({super.key,
  required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 5.w),
      child: ListTile(
        leading: Icon(icon, size: 18.w),
        title: Text("${title}", style: CustomTextStyle().xxsmallBlackText),
        trailing: Icon(Icons.keyboard_arrow_right, size: 18.w),
      ),
    );
  }
}
