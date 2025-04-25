import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF6F4), // background 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Center(
                child: Icon(Icons.navigation, size: 100, color: Colors.black),
              ),
              const SizedBox(height: 40),
              const Text(
                'SELAMAT DATANG KEMBALI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1F1F),
                ),
              ),
              const SizedBox(height: 40),

              // Email Input
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF5C4033)),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF5C4033)),
                  suffixIcon: const Icon(Icons.visibility_off),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Button Masuk
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3C00),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Masuk', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),

              // Link Daftar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum memiliki akun? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Daftar disini!",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
