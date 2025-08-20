import 'package:flutter/material.dart';
import 'package:flutter_lap3/order.dart';
import 'package:flutter_lap3/products.dart';
import 'package:flutter_lap3/profile.dart';
import 'package:flutter_lap3/cart.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> topImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO9c0UyrjwH9oBDAO2OC97FcVeR1oU3M7oMA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY39U6Xf9RwIg6LkUtRJgX1WP2Jn0DoRr3gQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUE8Bqmmm-Bf5s_rJ_6P-zQGofCeyUaAsT-w&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9sb10WIITGetFTYMaG7Owdv_EXhmfrtAQ6g&s",
  ];

  final List<Map<String, dynamic>> products = [
    {
      "name": "Phone",
      "price": 5000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgB5SnxV_P5rzyCh7QRScchrBzqCQTJrvjTg&s"
    },
    {
      "name": "PlayStation",
      "price": 10000,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC5tQ5IYn84T9Sw3nWZMtJq0ifmMjPbPBM7g&s"
    },
    {
      "name": "camera",
      "price": 800,
      "image":
          "https://cdn.media.amplience.net/i/canon/eos-r8-frt_gallery-module_05_365x228_aa065f319187416e9ccdd3d67a9ba48b?hotspot-dt-jpg"
    },
    {
      "name": "smartwatch",
      "price": 900,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQmpdFtX7XSFo3OouaODlEtPOO-5V5zMUJkg&s"
    },
    {
      "name": "laptop",
      "price": 3000,
      "image":
          "https://i5.walmartimages.com/seo/HP-15-6-Ryzen-5-8GB-256GB-Laptop-Rose-Gold_36809cf3-480b-47a5-94f0-e1d5e70c58c0_3.fcc0d6494b0e279a13c32c80c28abfa3.jpeg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),

      
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Khaled"),
              accountEmail: Text("khaled@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Products"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Products()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => card()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Orders"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Order()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: topImages.map((url) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      width: 400,
                      color: Colors.grey[300],
                      child: url.isNotEmpty
                          ? Image.network(url, fit: BoxFit.cover)
                          : Icon(Icons.image, size: 50),
                    );
                  }).toList(),
                ),
              ),
            ),

            
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Featured Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            
            Container(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: products.map((p) {
                    return Container(
                      width: 150,
                      margin: EdgeInsets.all(8),
                      color: Colors.grey[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          p["image"].isNotEmpty
                              ? Image.network(p["image"], height: 200)
                              : Icon(Icons.image, size: 60),
                          SizedBox(height: 8),
                          Text(
                            p["name"],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${p["price"]} EGP",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
