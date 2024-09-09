import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/models/cart_item.dart'; // Ensure the path is correct

class MasalasItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masala Items'),
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
              'Cumin Masala',
              '100 g',
              180.0,
              'assets/masalas/cumin.png',
              Colors.brown,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Chili Masala',
              '200 g',
              220.0,
              'assets/masalas/chilli.png',
              Colors.red,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Garam Masala',
              '50 g',
              250.0,
              'assets/masalas/garam.png',
              Colors.deepPurple,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Coriander Masala',
              '100 g',
              200.0,
              'assets/masalas/corainder.png',
              Colors.green,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Turmeric Masala',
              '200 g',
              160.0,
              'assets/masalas/turmeric.png',
              Colors.yellow,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Pav Bhaji Masala',
              '100 g',
              210.0,
              'assets/masalas/pav.png',
              Colors.orange,
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
