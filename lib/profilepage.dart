import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ProfileScreen(
          providerConfigs: [EmailProviderConfiguration()],
          children: [
            Text("Your Profile"),
          ],
        ),
      ),
    );
  }
}
