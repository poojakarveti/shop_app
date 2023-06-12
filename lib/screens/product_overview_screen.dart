// import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

import '../widgets/products.grid.dart';
import '../widgets/badge.dart';
import './cart_screen.dart';

enum filterOptions {
  Favourites,
  All,
}

class ProductsOverviewscreen extends StatefulWidget {
  @override
  _ProductsOverviewscreenState createState() => _ProductsOverviewscreenState();
}

class _ProductsOverviewscreenState extends State<ProductsOverviewscreen> {
  var _ShowOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOptions selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.Favourites) {
                  _ShowOnlyFavourites = true;
                } else {
                  _ShowOnlyFavourites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('only favourites'),
                value: filterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: filterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch ?? Text("null"),
              value: Provider.of<Cart>(context, listen: false)
                  .itemCount
                  .toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_ShowOnlyFavourites),
    );
  }
}
