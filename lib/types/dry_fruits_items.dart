import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/models/cart_item.dart'; // Ensure the path is correct

class DryFruitsItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dry Fruit Items'),
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
              'Almonds',
              '200 g',
              500.0,
              'assets/dry/almonds.png',
              Colors.brown,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Cashews',
              '150 g',
              450.0,
              'assets/dry/cashews.png',
              Colors.cyan,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Walnuts',
              '200 g',
              600.0,
              'assets/dry/walnuts.png',
              Colors.grey,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Raisins',
              '100 g',
              250.0,
              'assets/dry/raisins.png',
              Colors.deepPurple,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Pistachios',
              '150 g',
              550.0,
              'assets/dry/pistachios.png',
              Colors.green,
            ),
            SizedBox(height: 16),
            _buildItemCard(
              context,
              'Dates',
              '250 g',
              400.0,
              'assets/dry/dates.png',
              Colors.redAccent,
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
