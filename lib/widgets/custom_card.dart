import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/models/card_models.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Center(child: Image.asset(image, width: 100.w)),
            SizedBox(height: 15.h),
            Text(title, style: CustomTextStyle().xxsmallBlackBoldText),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: CustomTextStyle().xxsmallBlackBoldText),
                Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    color: Color(0xff53B175),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20.w),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
