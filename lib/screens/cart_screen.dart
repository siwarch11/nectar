import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);

    return Scaffold(
      backgroundColor: Colors.white, // Set the whole Scaffold background to white
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white, // AppBar background color white
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Image.asset(item["image"], width: 60, height: 60, fit: BoxFit.cover),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["title"],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text("1kg, Price", style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.grey),
                            onPressed: () {
                              // Decrease quantity logic
                            },
                          ),
                          Text(item["quantity"].toString(), style: TextStyle(fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.add_circle, color: Colors.green),
                            onPressed: () {
                              // Increase quantity logic
                            },
                          ),
                        ],
                      ),
                      Text(
                        "\$${(item["price"] * item["quantity"]).toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      // Delete item logic
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("\$${total.toStringAsFixed(2)}", style: TextStyle(fontSize: 18, color: Colors.green)),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to checkout page
            },
            child: Text("Go to Checkout", style: TextStyle(fontSize: 18, color: Colors.white)), // White text color
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.white, // BottomNavigationBar background color white
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            currentIndex: 2, // Set to 2 as CartScreen is currently selected
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index == 0) {
                // Navigate to HomeScreen
                Navigator.pushNamed(context, '/home');
              } 
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
            ],
          ),
        ],
      ),
    );
  }
}
