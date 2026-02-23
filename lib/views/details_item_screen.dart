import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/product_detail_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:provider/provider.dart';

class DetailsItemScreen extends StatelessWidget {
  const DetailsItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<ProductDetailProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              color: Colors.grey.shade200,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bottomNavigation");
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 20.w),
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/item-1.png",
                        width: 180.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.all(15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Naturel Red Apple",
                        style: CustomTextStyle().smallBlackBoldText,
                      ),
                      Icon(Icons.favorite_outline, size: 22.w),
                    ],
                  ),

                  Text(
                    "1kg, Price",
                    style: CustomTextStyle().xxsmallBlackBoldText.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Row(
                          spacing: 5.w,
                          children: [
                            IconButton(
                              onPressed: detailsProvider.decrementQuntity,
                              icon: Icon(Icons.remove, size: 22.w),
                            ),
                            Text(
                              "${detailsProvider.quntity}",
                              style: CustomTextStyle().smallBlackBoldText,
                            ),
                            IconButton(
                              onPressed: detailsProvider.incrementQuntity,
                              icon: Icon(
                                Icons.add,
                                size: 22.w,
                                color: Color(0xff53B175),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Text(
                          "\$0.0",
                          style: CustomTextStyle().largeBlackBoldText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
