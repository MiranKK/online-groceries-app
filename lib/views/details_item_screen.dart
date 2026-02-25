import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/provider/product_detail_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class DetailsItemScreen extends StatefulWidget {
  final String name;
  final String image;
  final String productDetail;
  final String review;
  final double price;

  const DetailsItemScreen({
    super.key,
    required this.image,
    required this.name,
    required this.productDetail,
    required this.review,
    required this.price,
  });

  @override
  State<DetailsItemScreen> createState() => _DetailsItemScreenState();
}

class _DetailsItemScreenState extends State<DetailsItemScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProductDetailProvider>().basePrice(widget.price);
  }

  bool _isfav = false;

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
                    Center(child: Image.asset(widget.image, width: 180.w)),
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
                        widget.name,
                        style: CustomTextStyle().smallBlackBoldText,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isfav = true;
                          });
                          detailsProvider.addFavItems(
                            widget.name,
                            widget.image,
                            widget.price,
                            context
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${widget.name} added to Favorite!",
                                style: CustomTextStyle().xsmallWhiteBoldText,
                              ),
                              backgroundColor: const Color(0xff53B175),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: _isfav
                            ? 
                             Icon(
                                Icons.favorite,
                                size: 22.w,
                                color: Colors.red,
                              ):Icon(Icons.favorite_outline, size: 22.w),
                      ),
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
                              onPressed: () {
                                context
                                    .read<ProductDetailProvider>()
                                    .incrementQuntity();
                                context.read<ProductDetailProvider>().basePrice(
                                  widget.price,
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                size: 22.w,
                                color: const Color(0xff53B175),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Text(
                          "\$${detailsProvider.totalprice.toStringAsFixed(2)}",
                          style: CustomTextStyle().xsmallBlackBoldText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  ExpansionTile(
                    expansionAnimationStyle: const AnimationStyle(
                      duration: Duration(milliseconds: 400),
                    ),
                    onExpansionChanged: detailsProvider.changeExpanded,
                    trailing: detailsProvider.isexpand
                        ? Icon(Icons.keyboard_arrow_down, size: 22.w)
                        : const Icon(Icons.keyboard_arrow_right),
                    title: Text(
                      "Product Detail",
                      style: CustomTextStyle().xsmallBlackBoldText,
                    ),
                    children: [
                      Text(
                        widget.productDetail,
                        style: CustomTextStyle().xxsmallBlackText.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),

                  ExpansionTile(
                    onExpansionChanged: detailsProvider.changeExpanded2,
                    trailing: detailsProvider.isexpand2
                        ? Icon(Icons.keyboard_arrow_down, size: 22.w)
                        : const Icon(Icons.keyboard_arrow_right),
                    expansionAnimationStyle: const AnimationStyle(
                      duration: Duration(milliseconds: 400),
                    ),
                    title: Text(
                      "Review",
                      style: CustomTextStyle().xsmallBlackBoldText,
                    ),
                    children: [
                      Text(
                        widget.review,
                        style: CustomTextStyle().xxsmallBlackText.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.r),
        child: CustomButton(
          onpressed: () {
            detailsProvider.addCartItems(
              widget.name,
              widget.image,
              widget.price,
              widget.productDetail,
              widget.review,
            );
            context.read<ProductDetailProvider>().quntity;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${widget.name} added to basket!",
                  style: CustomTextStyle().xsmallWhiteBoldText,
                ),
                backgroundColor: const Color(0xff53B175),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          text: Text(
            "Add To Basket",
            style: CustomTextStyle().xsmallWhiteBoldText,
          ),
        ),
      ),
    );
  }
}
