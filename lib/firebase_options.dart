// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAG6ptJRkBsOcrPgUs_ugafhBPtZMWMeLQ',
    appId: '1:626865080846:web:3bf9110e82029520218a5f',
    messagingSenderId: '626865080846',
    projectId: 'instagramclone-69abe',
    authDomain: 'instagramclone-69abe.firebaseapp.com',
    storageBucket: 'instagramclone-69abe.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAL2CMi7X9VAf0MxQaMDgDMfHZ3zh0SlwA',
    appId: '1:626865080846:android:eb76ea736a018a6c218a5f',
    messagingSenderId: '626865080846',
    projectId: 'instagramclone-69abe',
    storageBucket: 'instagramclone-69abe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8eEuYcViZCJ5-znOLWxwzM4yfwvh6I8M',
    appId: '1:626865080846:ios:59895b2e41f44521218a5f',
    messagingSenderId: '626865080846',
    projectId: 'instagramclone-69abe',
    storageBucket: 'instagramclone-69abe.appspot.com',
    androidClientId: '626865080846-16grt3s883tq62kk15c5k308lfk3bdl2.apps.googleusercontent.com',
    iosClientId: '626865080846-bhe3t727ajr81d555v646a800rb7ldko.apps.googleusercontent.com',
    iosBundleId: 'com.ex.in',
  );
}