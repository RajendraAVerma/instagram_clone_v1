// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:instagram_clone/model/usermodel.dart';

// class Testing1 extends StatelessWidget {
//   const Testing1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
//             if (snapshot.hasData) {
//               final String email = snapshot.data!.email;
//               return StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('users')
//                     .where('email', isEqualTo: email)
//                     .snapshots(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
//                         snapshot) {
//                   if (snapshot.hasData) {
//                     final list = snapshot.data!.docs
//                         .map((document) => UserData.fromJson(document.data()))
//                         .toList();
//                     if (list.isNotEmpty) {
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: list.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final userData = list[index];
//                           return Text(userData
//                               .name); // can print properties of userData model
//                         },
//                       );
//                     }
//                     return const Text("NO DATA AVAILABLE");
//                   }
//                   return const Text("Loading");
//                 },
//               );
//             }
//             return const Center(
//               child: Text("logged out"),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
