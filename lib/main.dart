import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just/screens/example.dart';
import 'package:just/screens/final.dart';
import 'package:just/screens/home_page.dart';
import 'package:just/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAppCheck.instance
  //     .activate(androidProvider: AndroidProvider.debug);
  // .activate(
  // webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  // // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
  // // your preferred provider. Choose from:
  // // 1. debug provider
  // // 2. safety net provider
  // // 3. play integrity provider
  // androidProvider: AndroidProvider.debug,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
