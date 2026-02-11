import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/images/second-logo.png")),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey.shade700,
                          size: 20.w,
                        ),
                        Text(
                          "Kurdistan/Sulaimanyah",
                          style: CustomTextStyle().xsmallBlackText,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    TextField(
                      style: CustomTextStyle().xsmallBlackText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.r),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.w,
                          color: Colors.black,
                        ),
                        hintText: "Search Store",
                        hintStyle: CustomTextStyle().xsmallBlackText.copyWith(
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff53B175)),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Image.asset("assets/images/banner-1.png"),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          "Exclusive Offer",
                          style: CustomTextStyle().smallBlackBoldText,
                        ),
                        Text(
                          "See all",
                          style: CustomTextStyle().xxsmallBlackText.copyWith(
                            color: Color(0xff53B175),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SliverGrid.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/images/item-1.png",
                              width: 100.w,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            "Red Apple",
                            style: CustomTextStyle().xxsmallBlackBoldText,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                "\$4.99",
                                style: CustomTextStyle().xxsmallBlackBoldText,
                              ),
                              IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Color(0xff53B175),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
