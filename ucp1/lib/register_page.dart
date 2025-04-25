import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF7F4),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Halaman Daftar'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Ini halaman register',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
