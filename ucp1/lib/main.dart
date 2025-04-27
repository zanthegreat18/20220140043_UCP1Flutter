import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';
import 'package:ucp1/register_page.dart'; // <--- Import register page juga bro

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(), // <-- Tambahin register
      },
    );
  }
}

