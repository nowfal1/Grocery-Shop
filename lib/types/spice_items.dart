import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/models/cart_item.dart'; // Ensure the path is correct

class SpiceItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spice Items'),
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
              'Black Pepper',
              '100 g',
              200.0,
              'assets/spices/pepper.png',
              Colors.deepOrange,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Turmeric Powder',
              '200 g',
              150.0,
              'assets/spices/turmeric.png',
              Colors.amber,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Cumin Seeds',
              '50 g',
              120.0,
              'assets/spices/cumin.png',
              Colors.brown,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Coriander Powder',
              '150 g',
              180.0,
              'assets/spices/corainder.png',
              Colors.green,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Red Chili Powder',
              '100 g',
              160.0,
              'assets/spices/chilli.png',
              Colors.red,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Garam Masala',
              '50 g',
              250.0,
              'assets/spices/garam.png',
              Colors.deepPurple,
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
