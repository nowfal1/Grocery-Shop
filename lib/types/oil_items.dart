import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/models/cart_item.dart'; // Ensure the path is correct

class OilItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oil Items'),
        backgroundColor: Colors.green,
        elevation: 4,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildItemCard(
              context,
              'Olive Oil',
              '500 ml',
              400.0,
              'assets/oils/olive.png',
              Colors.green,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Sunflower Oil',
              '1 L',
              250.0,
              'assets/oils/sunflower.png',
              Colors.yellow,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Coconut Oil',
              '500 ml',
              350.0,
              'assets/oils/coconut.png',
              Colors.cyan,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Sesame Oil',
              '500 ml',
              300.0,
              'assets/oils/sesame.png',
              Colors.brown,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Mustard Oil',
              '1 L',
              220.0,
              'assets/oils/mustard.png',
              Colors.orange,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Groundnut Oil',
              '500 ml',
              270.0,
              'assets/oils/ground.png',
              Colors.deepOrange,
            ),
            // Add more items as needed
          ],
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
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '$weight - ₹${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
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
