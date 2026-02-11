import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/provider/user_provider.dart';
import 'package:online_groceries_app_ui/views/login_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await userprovider.signout();
            if (userprovider.errormessage == null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Sign out successfully")));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(userprovider.errormessage!)),
              );
            }
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
