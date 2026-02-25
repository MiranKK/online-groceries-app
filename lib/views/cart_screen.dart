import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/models/card_models.dart';
import 'package:online_groceries_app_ui/provider/product_detail_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, "/"),
          icon: Icon(Icons.arrow_back, size: 18.w),
        ),
        title: Text("My Cart", style: CustomTextStyle().xxsmallBlackBoldText),
      ),
      body: Selector<ProductDetailProvider, List<CardModel>>(
        selector: (_, p) => p.cartItems,
        builder: (context, cartItems, _) {
          if (cartItems.isEmpty) {
            return const Center(child: Text("Your Cart is empty"));
          }
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Dismissible(
                key: Key(item.title),
                direction: DismissDirection.endToStart, // swipe left to delete
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  context.read<ProductDetailProvider>().removeCartItem(
                    item.title,
                  );
                },

                child: ListTile(
                  leading: Image.asset(item.image),
                  title: Text(
                    item.title,
                    style: CustomTextStyle().xsmallBlackBoldText,
                  ),
                  subtitle: Text(
                    "Qty: ${item.quantity}",
                    style: CustomTextStyle().xxsmallBlackText,
                  ),
                  trailing: Text(
                    "\$${item.price.toStringAsFixed(2)}",
                    style: CustomTextStyle().xsmallBlackBoldText,
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Selector<ProductDetailProvider, double>(
          selector: (_, p) => p.cartTotalPrice,
          builder: (context, total, _) {
            return CustomButton(
              onpressed: () {},
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    "Go to Checkout: ",
                    style: CustomTextStyle().xxsmallWhiteBoldText,
                  ),
                  Text(
                    "\$${total.toStringAsFixed(2)}",
                    style: CustomTextStyle().xxsmallWhiteBoldText,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
