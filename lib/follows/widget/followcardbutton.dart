import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/follows/services/database.dart';
import 'package:instagram_clone/model/usermodel.dart';

class FollowCardButton extends StatelessWidget {
  const FollowCardButton({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FollowsDatabase.isIFollowQuery(userId: userModel.uid),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.exists) {
              return ElevatedButton(
                onPressed: () {},
                child: Text("You follow"),
              );
            } else {
              return ElevatedButton(
                onPressed: () {},
                child: Text('Follow'),
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
