import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/postlistveiw.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram Clone"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          child: Column(
            children: [
              PostListView(),
            ],
          ),
        ),
      ),
    );
  }
}
