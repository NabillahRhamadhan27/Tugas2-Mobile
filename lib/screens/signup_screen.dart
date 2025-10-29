import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:aplikasilogin/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Fungsi simulasi registrasi lokal
  void register() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirm = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirm.isEmpty) {
      _showDialog('Peringatan', 'Semua kolom harus diisi.');
      return;
    }

    if (password != confirm) {
      _showDialog('Peringatan', 'Password dan konfirmasi tidak sama.');
      return;
    }

    // ✅ Simulasi akun berhasil dibuat
    _showDialog(
      'Berhasil',
      'Akun berhasil dibuat! Silakan login.',
      onClose: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      },
    );
  }

  void _showDialog(String title, String message, {VoidCallback? onClose}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (onClose != null) onClose();
            },
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
                    'Sign-up',
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

                  // 🧍 Full Name
                  CustomTextField(
                    hintText: 'Your Full Name',
                    icon: Icons.person,
                    controller: nameController,
                  ),
                  const SizedBox(height: 12),

                  // ✉️ Email
                  CustomTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  const SizedBox(height: 12),

                  // 🔒 Password
                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 12),

                  // 🔒 Confirm Password
                  CustomTextField(
                    hintText: 'Confirm Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: register, // ✅ panggil fungsi register
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Already have an account? Login here",
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
