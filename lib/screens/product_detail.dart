import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  ProductDetailScreen({required this.title, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Product Detail", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white, // Set the background color of the body to white
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image without shadow (removed shadow here)
              Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(image, height: 200, fit: BoxFit.contain),
                  ),
                ),
              ),
              // Détails principaux
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "1kg, Price",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.favorite_border, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Prix et quantité
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle, color: Colors.green),
                          onPressed: () {},
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle, color: Colors.green),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Text(
                      price,
                      style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Section "Product Detail"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ExpansionTile(
                  title: Text("Product Detail", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthy and varied diet.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              // Section "Nutritions"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  title: Text("Nutritions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
              // Section "Review"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  title: Text("Review", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star_half, color: Colors.orange, size: 16),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Add To cart", style: TextStyle(fontSize: 12, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
