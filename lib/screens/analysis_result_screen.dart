import 'package:flutter/material.dart';

class AnalysisResultScreen extends StatelessWidget {
  const AnalysisResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analysis Results")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("The analysis of your skin is complete ✅", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricCard("Moisture", "76%"),
              _buildMetricCard("Firmness", "87%"),
              _buildMetricCard("Texture", "58%"),
            ],
          ),
          const SizedBox(height: 30),
          const Text("Notable Active Ingredients (Celestia Ref)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: const Text("Niacinamide"), backgroundColor: Colors.pink[50]),
              Chip(label: const Text("Hyaluronic Acid"), backgroundColor: Colors.pink[50]),
              Chip(label: const Text("Salicylic Acid"), backgroundColor: Colors.pink[50]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}