import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/models/cart_item.dart'; // Ensure the path is correct

class RiceItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rice Items'),
        backgroundColor: Colors.teal[800],
        elevation: 6,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              _buildItemCard(
                context,
                'Basmati Rice',
                '10 kg',
                2500.0,
                'assets/basmathi.png',
                Colors.orangeAccent,
              ),
              SizedBox(height: 16),
              _buildItemCard(
                context,
                'Jasmine Rice',
                '5 kg',
                1500.0,
                'assets/jasmine.png',
                Colors.teal,
              ),
              SizedBox(height: 16),
              _buildItemCard(
                context,
                'Long Grain Rice',
                '20 kg',
                3000.0,
                'assets/long-rice.png',
                Colors.brown,
              ),
              SizedBox(height: 16),
              _buildItemCard(
                context,
                'Samba Rice',
                '10 kg',
                2200.0,
                'assets/samba.png',
                Colors.deepOrange,
              ),
              SizedBox(height: 16),
              _buildItemCard(
                context,
                'Idli Rice',
                '5 kg',
                1800.0,
                'assets/idly.png',
                Colors.grey,
              ),
              SizedBox(height: 16),
              _buildItemCard(
                context,
                'Small Type Rice',
                '15 kg',
                2000.0,
                'assets/small-rice.png',
                Colors.amber,
              ),
              // Add more items as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(
    BuildContext context,
    String name,
    String weight,
    double price,
    String imageUrl,
    Color color,
  ) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.teal[800],
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '$weight - ₹${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart, color: color),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addItem(
                CartItem(
                  name: name,
                  weight: weight,
                  price: price,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$name added to cart'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
