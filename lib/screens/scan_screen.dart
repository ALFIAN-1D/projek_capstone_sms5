import 'package:flutter/material.dart';
import 'analysis_result_screen.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Skin Scanning...", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pinkAccent, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "[ Simulasi Kamera / Grid Wajah AI ]",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE83A7F)),
                onPressed: () {
                  // Simulasi selesai scan dan pindah ke halaman hasil analisis
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AnalysisResultScreen()),
                  );
                },
                child: const Text("Ambil Foto & Analisis", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}