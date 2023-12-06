import 'package:flutter/material.dart';
import 'package:mobile_dev_flutter/pages/home.dart';
import 'package:mobile_dev_flutter/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}