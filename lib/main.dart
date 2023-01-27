import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just/screens/login_page.dart';

import 'package:just/canBeDeleted/example.dart';
import 'package:just/canBeDeleted/final.dart';
import 'package:just/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      // home: HeroExmaple1(),
    );
  }
}
