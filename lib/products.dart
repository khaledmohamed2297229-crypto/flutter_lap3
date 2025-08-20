import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> allProducts = [
    {
      "name": "Phone",
      "description": "Smartphone with high performance",
      "price": 5000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgB5SnxV_P5rzyCh7QRScchrBzqCQTJrvjTg&s"
    },
    {
      "name": "PlayStation",
      "description": "Next-gen gaming console",
      "price": 10000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC5tQ5IYn84T9Sw3nWZMtJq0ifmMjPbPBM7g&s"
    },
    
    {
      "name": "Camera",
      "description": "High resolution DSLR",
      "price": 800,
      "image":
          "https://cdn.media.amplience.net/i/canon/eos-r8-frt_gallery-module_05_365x228_aa065f319187416e9ccdd3d67a9ba48b?hotspot-dt-jpg"
    },
    {
      "name": "Smartwatch",
      "description": "Track fitness and notifications",
      "price": 900,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQmpdFtX7XSFo3OouaODlEtPOO-5V5zMUJkg&s"
    },
    {
      "name": "Laptop",
      "description": "Powerful laptop for work",
      "price": 3000,
      "image":
          "https://i5.walmartimages.com/seo/HP-15-6-Ryzen-5-8GB-256GB-Laptop-Rose-Gold_36809cf3-480b-47a5-94f0-e1d5e70c58c0_3.fcc0d6494b0e279a13c32c80c28abfa3.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: allProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          final product = allProducts[index];
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => FractionallySizedBox(
                  heightFactor: 0.6, 
                  child: ProductDetailsSheet(product),
                ),
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(product["image"], height: 100),
                  SizedBox(height: 8),
                  Text(product["name"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("${product["price"]} EGP",
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsSheet extends StatefulWidget {
  final Map<String, dynamic> product;
  ProductDetailsSheet(this.product);

  @override
  _ProductDetailsSheetState createState() => _ProductDetailsSheetState();
}

class _ProductDetailsSheetState extends State<ProductDetailsSheet> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.network(product["image"], height: 150)),
          SizedBox(height: 10),
          Text(product["name"],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(product["description"] ?? "No description available",
              style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          SizedBox(height: 10),
          Text("${product["price"]} EGP",
              style: TextStyle(fontSize: 20, color: Colors.green)),
          SizedBox(height: 20),

          
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
              ),
              Text("$quantity", style: TextStyle(fontSize: 18)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() => quantity++);
                },
              ),
            ],
          ),
          SizedBox(height: 20),

          
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.red),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${product["name"]} added to Wishlist")));
                },
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart),
                label: Text("Add to Cart"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "${product["name"]} x$quantity added to Cart")));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
