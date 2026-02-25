import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/models/card_models.dart';
import 'package:online_groceries_app_ui/provider/search_provider.dart';
import 'package:online_groceries_app_ui/views/details_item_screen.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {

  final List<CardModel>? products;

  const ExploreScreen({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchProvider>().initProduct(products!);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
       
            TextField(
              controller: context.read<SearchProvider>().searchController,
              onChanged: (value) {
                context.read<SearchProvider>().searchByName(value);
              },
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search, color: Color(0xff53B175)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    context.read<SearchProvider>().clearSearch();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),

            SizedBox(height: 15.h),

         
            Expanded(
              child: Selector<SearchProvider, List<CardModel>>(
                selector: (_, p) => p.filterProduct,
                builder: (context, filteredProducts, _) {
                  if (filteredProducts.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off,
                              size: 60.w, color: Colors.grey),
                          SizedBox(height: 10.h),
                          Text(
                            "No products found",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsItemScreen(
                                name: product.title,
                                image: product.image,
                                productDetail: product.productDetail ?? '',
                                review: product.review ?? '',
                                price: product.price,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    product.image,
                                    width: 100.w,
                                    height: 100.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "\$${product.price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    color: Color(0xff53B175),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}