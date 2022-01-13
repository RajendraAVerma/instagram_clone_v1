import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/homepage/addphoto.dart';
import 'package:instagram_clone/homepage/homecontent.dart';
import 'package:instagram_clone/profilepage.dart';
import 'package:instagram_clone/providers/addphotoprovider.dart';
import 'package:provider/provider.dart';

import '../model/usermodel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  final authUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    BottomNavigationProvider provider =
        Provider.of<BottomNavigationProvider>(context);
    List<Widget> widgetList = [
      HomeContent(),
      Container(
        color: Colors.red,
      ),
      MyProfilePage(),
    ];
    return Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: provider.index,
      ),
      floatingActionButton: Consumer<AddPhotoProvider>(
        builder: (context, provider, child) {
          return FloatingActionButton(
            onPressed: () => addPhoto(context: context, provider: provider),
            child: Icon(Icons.add),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.index,
        onTap: (value) {
          provider.setIndex(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

class BottomNavigationProvider extends ChangeNotifier {
  int index = 0;
  void setIndex(int i) {
    index = i;
    notifyListeners();
  }
}
