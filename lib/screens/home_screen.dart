import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> products = [
    {
      "title": "Organic Bananas",
      "price": "\$4.99",
      "image": "lib/assets/images/banana.png",
      "quantity": "7 pcs,Priceg",
    }, {
      "title": "Red Apple",
      "price": "\$4.99",
      "image": "lib/assets/images/apple.png",
      "quantity": "1 kg,Priceg",
    }, {
      "title": "Organic Bananas",
      "price": "\$4.99",
      "image": "lib/assets/images/banana.png",
      "quantity": "7 pcs,Priceg",
    }, 
    {
      "title": "Red Apple",
      "price": "\$4.99",
      "image": "lib/assets/images/apple.png",
      "quantity": "1 kg,Priceg",
    },
  ];

  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, String> product) {
    setState(() {
      cartItems.add({
        "title": product["title"],
        "price": double.parse(product["price"]?.substring(1) ?? '0'),
        "quantity": 1,
        "image": product["image"]
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background of the body is set to white
      body: Container(
        color: Colors.white, // Set the background color of the body to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18),
            Center(
              child: Image.asset('lib/assets/images/logo.png', height: 44),
            ),
            SizedBox(height: 16),

            // Location with Icon centered
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Dhaka, Banassre",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Search Box with light grey background and rounded corners
            TextField(
              decoration: InputDecoration(
                hintText: "Search Store",
                prefixIcon: Icon(Icons.search),
                filled: true, // To enable background color
                fillColor: Colors.grey[200], // Light grey background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  borderSide: BorderSide.none, // Remove border
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
            ),
            SizedBox(height: 16),

            // Exclusive Offer with See All button on the same line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Exclusive Offer",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Handle See All action
                  },
                  child: Text("See All", style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Product Grid List
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            title: products[index]["title"]!,
                            price: products[index]["price"]!,
                            image: products[index]["image"]!,
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      title: products[index]["title"]!,
                      price: products[index]["price"]!,
                      image: products[index]["image"]!,
                      quantity: products[index]["quantity"]!,
                      onAddToCart: () => addToCart(products[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems),
                  ),
                );
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
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String quantity;
  final VoidCallback onAddToCart;

  ProductCard({
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Rounded corners
      elevation: 4, // Increased elevation for better shadow effect
      shadowColor: Colors.grey.withOpacity(0.2), // Light shadow color for a subtle effect
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set background color of the card to white
          border: Border.all(color: Colors.grey[300]!, width: 1), // Light grey border
          borderRadius: BorderRadius.circular(15), // Rounded corners for the border
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 80, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(quantity, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),

            // Align price and add to cart icon horizontally
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(price, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.green),
                  onPressed: onAddToCart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}