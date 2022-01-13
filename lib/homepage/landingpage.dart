import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/homepage/creatingaccountform.dart';
import 'package:instagram_clone/homepage/homepage.dart';
import 'package:instagram_clone/model/usermodel.dart';
import 'package:instagram_clone/providers/addphotoprovider.dart';
import 'package:instagram_clone/providers/newaccountformprovider.dart';
import 'package:instagram_clone/testing/testing1.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DocumentSnapshot<UserModel>>(
        stream: UserModel.userCollRef.doc(uid).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<UserModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.exists) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider<BottomNavigationProvider>(
                    create: (context) => BottomNavigationProvider(),
                  ),
                  ChangeNotifierProvider<AddPhotoProvider>(
                    create: (context) => AddPhotoProvider(),
                  ),
                ],
                child: HomePage(userModel: snapshot.data!.data()!),
              );
            }
            return ChangeNotifierProvider(
              create: (context) => NewAccountFormProvider(),
              child: CreatingAccountForm(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
