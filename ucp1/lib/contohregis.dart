import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF6F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.navigation, size: 100, color: Colors.black),
              const SizedBox(height: 16),
              const Text(
                "DAFTAR AKUN BARU",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF1F1F1F),
                ),
              ),
              const SizedBox(height: 30),

              // Nama Lengkap
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Nama Lengkap"),
              ),
              const SizedBox(height: 8),
              customInputField(Icons.person_outline, "Nama Lengkap"),
              const SizedBox(height: 20),

              // Email & No HP
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email"),
                        const SizedBox(height: 8),
                        customInputField(Icons.email_outlined, "Email"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("No HP"),
                        const SizedBox(height: 8),
                        customInputField(Icons.phone, "No HP"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Password & Konfirmasi Password
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Password"),
                        const SizedBox(height: 8),
                        customPasswordField("Password"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Konfirmasi Password"),
                        const SizedBox(height: 8),
                        customPasswordField("Konfirmasi Password"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Tombol Daftar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3C00),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Daftar", style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),

              // Link Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah memiliki akun? Silahkan "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Login disini!",
                      style: TextStyle(color: Colors.red),
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

  // Custom Input Field
  static Widget customInputField(IconData icon, String hint) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.brown.shade800),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  // Custom Password Field
  static Widget customPasswordField(String hint) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.brown),
        suffixIcon: const Icon(Icons.visibility_off),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
