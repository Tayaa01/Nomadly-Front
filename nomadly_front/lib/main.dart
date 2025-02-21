import 'package:flutter/material.dart';
import 'package:nomadly_front/views/welcome_page.dart';
import 'package:nomadly_front/views/SignIn_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomadly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const WelcomePage(), // Set WelcomePage as the initial screen
      routes: {
        '/sign-in': (context) => const SignInPage(),
      },
    );
  }
}