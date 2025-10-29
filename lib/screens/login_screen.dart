import 'package:flutter/material.dart';
import 'package:aplikasilogin/screens/signup_screen.dart';
import 'package:aplikasilogin/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ✅ Data login dummy
  final String dummyEmail = 'nabilmochacinno2@gmail.com';
  final String dummyPassword = '123456';

  // 🧠 Fungsi simulasi login
  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showDialog('Peringatan', 'Email dan password tidak boleh kosong.');
      return;
    }

    if (email == dummyEmail && password == dummyPassword) {
      // ✅ Jika login berhasil
      Navigator.pushReplacementNamed(context, '/theater');
    } else {
      // ❌ Jika login gagal
      _showDialog('Login Gagal', 'Email atau password salah.');
    }
  }

  // 🔔 Fungsi tampilkan alert
  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/download.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black54,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Let’s get started',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 40),

                  // 📨 Email Field
                  CustomTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  const SizedBox(height: 12),

                  // 🔒 Password Field
                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.lightBlueAccent[100]),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🚀 Tombol Login
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: login, // ✅ panggil fungsi login
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: const [
                      Expanded(child: Divider(color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: const Icon(Icons.g_mobiledata, color: Colors.black),
                    label: const Text(
                      'Login with Google',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    label: const Text(
                      'Login with Facebook',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      "Don’t have an account? Register here",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
