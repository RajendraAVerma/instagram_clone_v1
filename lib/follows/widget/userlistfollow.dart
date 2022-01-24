import 'package:flutter/material.dart';
import 'package:instagram_clone/follows/widget/followcardbutton.dart';
import 'package:instagram_clone/model/usermodel.dart';

class UserListFollow extends StatelessWidget {
  const UserListFollow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<UserModel>>(
        stream: UserModel.userCollRef
            .snapshots()
            .map((event) => event.docs.map((e) => e.data()).toList()),
        builder:
            (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data!;
            if (list.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  final userModel = list[index];
                  return followCard(userModel: userModel);
                },
              );
            }
            return const Text("No User Present");
          }
          return const Text("Loading...");
        },
      ),
    );
  }

  Widget followCard({required UserModel userModel}) {
    return Container(
      child: Column(
        children: [
          Text(userModel.userName),
          FollowCardButton(userModel: userModel),
        ],
      ),
    );
  }
}
