import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';

class CustomButton extends StatelessWidget {
  final Object text;
  final VoidCallback onpressed;
  const CustomButton({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(270.w, 50.h),
        backgroundColor: const Color(0xff53B175),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onpressed,
      child:text is Widget ? text as Widget : Text(text as String,style: CustomTextStyle().mediumWhiteBoldText,),
    );
  }
}
