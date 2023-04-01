import 'package:app/screen/login.dart';
import 'package:app/screen/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zero Hunger',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 232, 241, 58),
      ),
      home: const Login(),
      //home: const SignUp(),
    );
  }
}
