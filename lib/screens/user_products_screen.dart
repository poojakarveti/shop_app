import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import './edit_products_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/User_Products';
  @override
  Widget build(BuildContext context) {
    final ProductsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('your products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: ProductsData.items.length,
          itemBuilder: (_, i) => Column(children: [
            UserProductItem(
              ProductsData.items[i].id,
              ProductsData.items[i].title,
              ProductsData.items[i].imageUrl,
            ),
            Divider(),
          ]),
        ),
      ),
    );
  }
}
