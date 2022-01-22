import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/follows/models/followersmodel.dart';
import 'package:instagram_clone/follows/models/followingmodel.dart';
import 'package:instagram_clone/model/usermodel.dart';

class FollowsDatabase {
  static final firestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final currentUserId = auth.currentUser!;

  static final followersCollRef = firestore
      .collection('users')
      .doc(currentUserId.uid)
      .collection('followers')
      .withConverter<Followers>(
        fromFirestore: (snapshot, options) =>
            Followers.fromJson(snapshot.data() as Map<String, dynamic>),
        toFirestore: (value, options) => value.toJson(),
      );

  static final followingCollRef = firestore
      .collection('users')
      .doc(currentUserId.uid)
      .collection('following')
      .withConverter<Following>(
        fromFirestore: (snapshot, options) =>
            Following.fromJson(snapshot.data() as Map<String, dynamic>),
        toFirestore: (value, options) => value.toJson(),
      );

  static Stream<List<Followers>> followersStream({required String uid}) {
    return followersCollRef
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  static Stream<List<Following>> followingStream({required String uid}) {
    return followingCollRef
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  static Future<void> addFollower({required String followerId}) async {
    try {
      Followers followers = Followers(id: followerId, date: "date");
      await followersCollRef.doc(followerId).set(followers);
    } catch (e) {
      print(e.toString() + ">>>>>>>>>>>>> error");
    }
  }

  static Future<void> addFollowing({required String followingId}) async {
    try {
      Following following = Following(id: followingId, date: "date");
    } catch (e) {
      print(e.toString() + ">>>>>>>>>>>>>>>>>>>>>>>");
    }
  }

  static Query<Following> isIFollowQuery({required String userId}) {
    final ref = firestore
        .collection('users')
        .doc(currentUserId.uid)
        .collection('following')
        .where('id', isEqualTo: userId)
        .withConverter<Following>(
          fromFirestore: (snapshot, options) =>
              Following.fromJson(snapshot.data() as Map<String, dynamic>),
          toFirestore: (value, options) => value.toJson(),
        );
    return ref;
  }

  static Query<Followers> isFollowMeQuery({required String userId}) {
    final ref = firestore
        .collection('users')
        .doc(currentUserId.uid)
        .collection('followers')
        .where('id', isEqualTo: userId)
        .withConverter<Followers>(
          fromFirestore: (snapshot, options) =>
              Followers.fromJson(snapshot.data() as Map<String, dynamic>),
          toFirestore: (value, options) => value.toJson(),
        );
    return ref;
  }
  // static Stream<bool> isFollowingMe({required String userId}) async {
  //   try {
  //     bool isFollowing = await firestore
  //     .collection('users')
  //     .doc(currentUserId.uid)
  //     .collection('followers').where('id', isEqualTo: userId).get()
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // static Stream<bool> isIFollowed({required String userId}) async {
  //   try {} catch (e) {
  //     print(e.toString());
  //   }
  // }
}
