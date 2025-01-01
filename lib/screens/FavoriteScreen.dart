import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteItems;

  const FavoriteScreen({super.key, required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,  // Set Scaffold background to white
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                "No favorite items yet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : SingleChildScrollView(  // Allow scrolling if needed
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: favoriteItems.map((item) {
                    return Card(
                      color: Colors.white,  // Set the background color of the card to white
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image'] ?? '',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          item['title'] ?? 'Unknown',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Quantity: ${item['quantity'] ?? 'N/A'}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$${(item['price'] != null ? double.tryParse(item['price'].substring(1)) : 0.0)?.toStringAsFixed(2) ?? '0.00'}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 4),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 22),
                              onPressed: () {
                                // Logic to remove the item from favorites
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
