import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:instagram_clone/model/usermodel.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    firebase_storage.FirebaseStorage instance =
        firebase_storage.FirebaseStorage.instance;
    firebase_storage.Reference ref = instance.ref().child("users");
    return Container(
      child: StreamBuilder<firebase_storage.ListResult>(
        stream: ref.listAll().asStream(),
        builder: (BuildContext context,
            AsyncSnapshot<firebase_storage.ListResult> snapshot) {
          if (snapshot.hasData) {
            final dirList = snapshot.data!.prefixes;
            if (dirList.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dirList.length,
                itemBuilder: (BuildContext context, int index) {
                  final userDir = dirList[index];
                  return StreamBuilder<firebase_storage.ListResult>(
                    stream: ref.child(userDir.name).listAll().asStream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                      if (snapshot.hasData) {
                        final list = snapshot.data!.items;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = list[index];
                            final linkStream = item.getDownloadURL().asStream();
                            return StreamBuilder<String>(
                              stream: linkStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.hasData) {
                                  final link = snapshot.data!;
                                  return Container(
                                    padding: EdgeInsets.all(30.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.network(link),
                                        ),
                                        Container(
                                          child: StreamBuilder<
                                              DocumentSnapshot<UserModel>>(
                                            stream: UserModel.userCollRef
                                                .doc(userDir.name)
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<
                                                        DocumentSnapshot<
                                                            UserModel>>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                final userModel =
                                                    snapshot.data!.data()!;
                                                return Text(userModel.userName);
                                              }
                                              return const Text("Loading...");
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return const Text("Please wait loading ...");
                              },
                            );
                          },
                        );
                      }
                      return const Text("wait loading...");
                    },
                  );
                },
              );
            }
            return const Text("NO IMAGE HERE");
          }
          return const Text("wait loading...");
        },
      ),
    );
  }
}
