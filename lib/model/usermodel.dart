import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String userName;
  final String dob;
  final String gender;
  UserModel({
    required this.uid,
    required this.userName,
    required this.dob,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      userName: data['userName'],
      dob: data['dob'],
      gender: data['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = uid;
    data['userName'] = userName;
    data['dob'] = dob;
    data['gender'] = gender;
    return data;
  }

  static final firestore = FirebaseFirestore.instance;
  static final user = FirebaseAuth.instance.currentUser!;
  static CollectionReference<UserModel> userCollRef =
      firestore.collection('users').withConverter<UserModel>(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data() as Map<String, dynamic>),
            toFirestore: (value, options) => value.toJson(),
          );

  static Future<void> creatingUserToFirestore({
    required String userName,
    required String dob,
    required String gender,
  }) async {
    UserModel userModel = UserModel(
      uid: user.uid,
      userName: userName,
      dob: dob,
      gender: gender,
    );

    await userCollRef.doc(user.uid).set(userModel);
  }
}
