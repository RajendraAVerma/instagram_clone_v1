import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SignInScreen(
          sideBuilder: (context, constraints) {
            return Text("This is sidebuilder");
          },
          providerConfigs: [
            PhoneProviderConfiguration(),
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(clientId: '...'),
          ],
        ),
      ),
    );
  }
}
