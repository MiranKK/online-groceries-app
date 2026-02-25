import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/models/card_models.dart';
import 'package:online_groceries_app_ui/provider/product_detail_provider.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';
import 'package:online_groceries_app_ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text("Favourite", style: CustomTextStyle().xxsmallBlackBoldText),
      ),
      body: Selector<ProductDetailProvider, List<CardModel>>(
        selector: (_, p) => p.favItems,
        builder: (context, favItems, _) {
          if (favItems.isEmpty) {
            return const Center(
              child: Text("You don't have any favorite item"),
            );
          }
          return ListView.builder(
            itemCount: favItems.length,
            itemBuilder: (context, index) {
              final item = favItems[index];
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
                  context.read<ProductDetailProvider>().removeFavItem(
                    item.title,
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(item.image),
                    title: Text(
                      item.title,
                      style: CustomTextStyle().xsmallBlackBoldText,
                    ),

                    trailing: Text(
                      "\$${item.price.toStringAsFixed(2)}",
                      style: CustomTextStyle().xsmallBlackBoldText,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
