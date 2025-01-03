import 'package:flutter/material.dart';
import 'package:nectar/screens/ExploreScreen.dart';
import 'package:nectar/screens/FavoriteScreen.dart';

import 'AcountScreen';
import 'cart_screen.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    },
    {
      "title": "Red Apple",
      "price": "\$4.99",
      "image": "lib/assets/images/apple.png",
      "quantity": "1 kg,Priceg",
    },
    {
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
    {
      "title": "Ginger",
      "price": "\$6.99",
      "image": "lib/assets/images/ginger.png",
      "quantity": "1 kg,Priceg",
    },
  ];

  List<Map<String, dynamic>> cartItems = [];
  List<Map<String, String>> favoriteItems = [];

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

  void toggleFavorite(Map<String, String> product) {
    setState(() {
      if (favoriteItems.contains(product)) {
        favoriteItems.remove(product);
      } else {
        favoriteItems.add(product);
      }
    });
  }

  bool isFavorite(Map<String, String> product) {
    return favoriteItems.contains(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            Center(
              child: Image.asset('lib/assets/images/logo.png', height: 34),
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Dhaka, Banassre",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Search Store",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Exclusive Offer",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Handle See All action
                  },
                  child: const Text("See All",
                      style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: products[index]["title"]!,
                    price: products[index]["price"]!,
                    image: products[index]["image"]!,
                    quantity: products[index]["quantity"]!,
                    isFavorite: isFavorite(products[index]),
                    onAddToCart: () => addToCart(products[index]),
                    onFavoriteToggle: () => toggleFavorite(products[index]),
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


                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
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
                offset: const Offset(0, -4),
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
                    builder: (context) => CartScreen(
                      cartItems: cartItems,
                      favoriteItems: favoriteItems,
                    ),
                  ),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoriteScreen(favoriteItems: favoriteItems),
                  ),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExploreScreen(),
                  ),
                );
              } else if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountScreen(),
                  ),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Account"),
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
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.onAddToCart,
    required this.onFavoriteToggle,
    required this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTap,
              child: Image.asset(image, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(quantity, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(price,
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavoriteToggle,
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart,
                      color: Colors.green),
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
