import 'package:flutter/material.dart';
import 'package:manpro_kel3/models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Smartphone Android Pro',
      description: 'Smartphone terbaru dengan processor terkuat dan kamera 48MP',
      price: 4999000,
      image: 'https://via.placeholder.com/300x300?text=Smartphone+Pro',
      stock: 50,
      rating: 4.8,
    ),
    Product(
      id: 2,
      name: 'Tablet 10 Inch',
      description: 'Tablet dengan layar AMOLED 10 inch untuk produktivitas maksimal',
      price: 2999000,
      image: 'https://via.placeholder.com/300x300?text=Tablet',
      stock: 30,
      rating: 4.5,
    ),
    Product(
      id: 3,
      name: 'Wireless Earbuds',
      description: 'Earbuds nirkabel dengan noise cancellation dan baterai 24jam',
      price: 799000,
      image: 'https://via.placeholder.com/300x300?text=Earbuds',
      stock: 100,
      rating: 4.6,
    ),
    Product(
      id: 4,
      name: 'Smartwatch Series 5',
      description: 'Smartwatch canggih dengan monitor detak jantung dan GPS',
      price: 1499000,
      image: 'https://via.placeholder.com/300x300?text=Smartwatch',
      stock: 40,
      rating: 4.7,
    ),
    Product(
      id: 5,
      name: 'Power Bank 25000mAh',
      description: 'Power bank berkapasitas besar dengan fast charging 65W',
      price: 299000,
      image: 'https://via.placeholder.com/300x300?text=Power+Bank',
      stock: 200,
      rating: 4.4,
    ),
    Product(
      id: 6,
      name: 'Portable Speaker',
      description: 'Speaker portabel dengan suara stereo dan waterproof IP67',
      price: 599000,
      image: 'https://via.placeholder.com/300x300?text=Speaker',
      stock: 60,
      rating: 4.3,
    ),
  ];

  List<Product> get products => _products;

  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return _products;
    }
    return _products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Product? getProductById(int id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
