import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';
import 'package:ucp1/register_page.dart';
import 'package:intl/date_symbol_data_local.dart'; // <<< Tambahin ini bro

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <<< WAJIB kalo ada async
  await initializeDateFormatting('id_ID', null); // <<< Inisialisasi locale Indonesia
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
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
