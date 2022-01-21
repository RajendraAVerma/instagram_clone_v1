import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

Future<void> sendToFirebase({required String path}) async {
  File file = File(path);
  final currentUser = FirebaseAuth.instance.currentUser!;
  final instance = firebase_storage.FirebaseStorage.instance;
  firebase_storage.SettableMetadata metadata =
      firebase_storage.SettableMetadata(
    customMetadata: {
      "uid": currentUser.uid,
    },
  );
  firebase_storage.Reference ref = instance
      .ref()
      .child('users')
      .child(currentUser.uid)
      .child(TimeOfDay.now().toString());
  final task = await ref.putFile(file, metadata).snapshotEvents.listen((event) {
    print(event.bytesTransferred);
  });
}
