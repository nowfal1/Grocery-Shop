class CartItem {
  final String name;
  final String weight;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.weight,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  void increaseQuantity() => quantity++;
  void decreaseQuantity() => quantity = quantity > 1 ? quantity - 1 : quantity;
}
