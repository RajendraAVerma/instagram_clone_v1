import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram Clone"),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
