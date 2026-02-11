import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app_ui/views/cart_screen.dart';
import 'package:online_groceries_app_ui/views/explore_screen.dart';
import 'package:online_groceries_app_ui/views/favorite_screen.dart';
import 'package:online_groceries_app_ui/views/home_screen.dart';
import 'package:online_groceries_app_ui/views/profile_screen.dart';

class BottomNavigationLayout extends StatefulWidget {
  const BottomNavigationLayout({super.key});

  @override
  State<BottomNavigationLayout> createState() => _BottomNavigationLayoutState();
}

class _BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  final List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff53B175),
        unselectedItemColor: Colors.black,
        iconSize: 18.w,
        selectedFontSize: 11.sp,
        unselectedFontSize: 11.sp,
        currentIndex: _currentScreen,
        onTap: (value) {
          setState(() {
            _currentScreen = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
