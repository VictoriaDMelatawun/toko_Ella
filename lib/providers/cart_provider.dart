import 'package:flutter/material.dart';
import 'package:manpro_kel3/models/cart_item.dart';
import 'package:manpro_kel3/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  int get itemCount => _items.length;

  void addToCart(Product product, {int quantity = 1}) {
    final existingItem = _items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(int productId, int newQuantity) {
    final item = _items.firstWhere((item) => item.product.id == productId);
    if (newQuantity > 0) {
      item.quantity = newQuantity;
    } else {
      removeFromCart(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
