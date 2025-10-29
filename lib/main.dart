import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/theater_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Login',
      theme: ThemeData(primarySwatch: Colors.indigo),

      // 🔹 Halaman pertama
      initialRoute: '/',

      // 🔹 Daftar route aplikasi
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/theater': (context) => const TheaterScreen(),
      },
    );
  }
}
