import 'package:flutter/material.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Status untuk beralih antara mode Register (Buat Akun) dan Login
  bool _isLoginMode = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5F7), // Nuansa pink soft
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              _isLoginMode ? "Welcome Back" : "Create Profile",
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              _isLoginMode ? "Login to your SkiniVerse account" : "Add your photo and details",
              style: const TextStyle(color: Color(0xFFE83A7F), fontSize: 12),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FOTO PROFIL (Hanya muncul saat mode Register)
            if (!_isLoginMode) ...[
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.pink.shade100, width: 2),
                    ),
                    child: Center(
                      child: Icon(Icons.person_outline, size: 50, color: Colors.pink[300]),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE83A7F),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text("Tap camera icon to add photo", style: TextStyle(color: Color(0xFFE83A7F), fontSize: 12)),
              const SizedBox(height: 20),
            ],

            // FORM INPUT
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.pink.withOpacity(0.05), blurRadius: 15, spreadRadius: 5),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: const Color(0xFFE83A7F), borderRadius: BorderRadius.circular(8)),
                        child: Icon(_isLoginMode ? Icons.login : Icons.edit, color: Colors.white, size: 16),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        _isLoginMode ? "Account Login" : "Personal Information",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Input Nama (Hanya tampil saat Register)
                  if (!_isLoginMode) ...[
                    _buildCustomTextField("Full Name", Icons.person_outline, "Enter your name", _nameController),
                    const SizedBox(height: 15),
                  ],

                  _buildCustomTextField("Email", Icons.email_outlined, "Enter your email", _emailController),
                  const SizedBox(height: 15),
                  _buildCustomTextField("Password", Icons.lock_outline, "Enter your password", _passwordController, isPassword: true),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // TOMBOL UTAMA (Create Profile / Login)
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Saat tombol ditekan, arahkan langsung ke halaman Beranda (HomeScreen)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE83A7F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: Text(
                  _isLoginMode ? "Login to SkiniVerse" : "Create Profile",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // TOMBOL TOGGLE ANTARA REGISTER & LOGIN
            TextButton(
              onPressed: () {
                setState(() {
                  _isLoginMode = !_isLoginMode;
                });
              },
              child: Text(
                _isLoginMode
                    ? "Don't have an account? Create Profile"
                    : "Already have an account? Login here",
                style: const TextStyle(color: Color(0xFFE83A7F), fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextField(String label, IconData icon, String hint, TextEditingController controller, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700], fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            prefixIcon: Icon(icon, color: Colors.black87),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }
}