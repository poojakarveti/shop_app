import 'package:flutter/material.dart';
import 'package:my_shop/widgets/product_item.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Red',
        description: 'A red shirt _ it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://5.imimg.com/data5/JF/MP/VK/SELLER-12028054/kids-plain-red-shirts-500x500.jpg'),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of Trousers,',
        price: 59.99,
        imageUrl:
            'https://media.istockphoto.com/photos/blue-chino-pants-with-brown-leather-belt-isolated-on-white-background-picture-id1149139165?k=20&m=1149139165&s=612x612&w=0&h=GZNt8WgiJ3tSbVmcAKbIUmFAzbulMTw1NJ7msG2Tyno='),
    Product(
      id: 'p3',
      title: 'Yello scarf',
      description: 'warm and cozy _ exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
        id: 'p4',
        title: 'A pan',
        description: 'prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/61n5oBkfeTL._SL1000_.jpg'),
  ];
  var _showFavouritesOnly = false;

  List<Product> get items {
    // if (_showFavouritesOnly) {
    //   return _items.where((ProdItem) => ProdItem.isFavourite).toList();
    // }
    return [..._items];
  }

  List<Product> get favouriteItems {
    return _items.where((ProdItem) => ProdItem.isFavourite).toList();
  }

  Product findById(String Id) {
    return _items.firstWhere((prod) => prod.id == Id);
  }

  // void showFavouritesOnly() {
  //   _showFavouritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavouritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newproduct = Product(
      id: DateTime.now.toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(newproduct);
    notifyListeners();
  }

  void updateproduct(String id, Product newproduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newproduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteproduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
