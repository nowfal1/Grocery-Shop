import 'package:flutter/material.dart';
import 'package:project/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final existingItem = _items.firstWhere(
      (i) => i.name == item.name && i.weight == item.weight,
      orElse: () => CartItem(name: '', weight: '', price: 0.0),
    );

    if (existingItem.name.isEmpty) {
      _items.add(item);
    } else {
      existingItem.increaseQuantity();
    }
    notifyListeners();
  }

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
