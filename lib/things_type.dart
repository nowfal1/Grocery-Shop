import 'package:flutter/material.dart';

class ThingsType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Grocery Type',
          style: TextStyle(
            letterSpacing: 2.4,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 4,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTypeButton(context, 'Rice', Colors.teal),
              SizedBox(height: 20),
              _buildTypeButton(context, 'Spices', Colors.orange),
              SizedBox(height: 20),
              _buildTypeButton(context, 'Masalas', Colors.purple),
              SizedBox(height: 20),
              _buildTypeButton(context, 'Dry Fruits',
                  const Color.fromARGB(255, 197, 152, 135)),
              SizedBox(height: 20),
              _buildTypeButton(
                  context, 'Oils', const Color.fromARGB(255, 211, 184, 102)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart'); // Navigate to CartPage
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  Widget _buildTypeButton(BuildContext context, String type, Color color) {
    return Container(
      width: 250, // Fixed width for the button
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context, '/${type.toLowerCase().replaceAll(' ', '_')}_items');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          elevation: 5,
        ),
        child: Text(
          type,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
