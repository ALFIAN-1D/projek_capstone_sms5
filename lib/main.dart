import 'package:flutter/material.dart';
import 'screens/auth_screen.dart'; // Import halaman profil/auth

void main() {
  runApp(const SkiniVerseApp());
}

class SkiniVerseApp extends StatelessWidget {
  const SkiniVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkiniVerse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE83A7F),
          primary: const Color(0xFFE83A7F),
        ),
        useMaterial3: true,
      ),
      // Ubah halaman utama ke AuthScreen (Halaman Profil / Registrasi)
      home: const AuthScreen(),
    );
  }
}