import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/authagate.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/homepage/landingpage.dart';
import 'package:instagram_clone/profilepage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone - Rajendra',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return AuthGate();
          }
          return LandingPage();
        },
      ),
    );
  }
}
