import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recommended Products")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: ListTile(
              leading: Container(width: 50, height: 50, color: Colors.grey[300]),
              title: const Text("Puriti Mighty Bamboo Serum"),
              subtitle: const Text("Rp449.100 • Shopee Mall"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Aksi membuka URL Shopee (Fitur 12)
                },
                child: const Text("Beli", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}