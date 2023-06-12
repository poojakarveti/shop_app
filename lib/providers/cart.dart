import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:my_shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    String Price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity + 1,
                price: existingCartItem.price,
              ));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: double.parse(Price),
          quantity: 1,
        ),
      );
      print(_items);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  removeSinleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (ExistingCartItem) => CartItem(
              id: ExistingCartItem.id,
              title: ExistingCartItem.title,
              quantity: ExistingCartItem.quantity,
              price: ExistingCartItem.price - 1));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  static void removeSingleItem(String id) {}

  void clear() {
    _items = {};
    notifyListeners();
  }
}
