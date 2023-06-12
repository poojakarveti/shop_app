import 'package:flutter/material.dart';
import 'package:my_shop/providers/product.dart';
import 'package:my_shop/providers/products.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double Price;
  // ProductDetailScreen(this.title);
  static const routeName = 'Product_detail';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedproduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(ProductId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedproduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
            ),
          Text('\$${loadedproduct.price}',
          style: TextStyle(
            color:Colors.grey,
            fontSize: 20,
             ),
             ),
             SizedBox(
              height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
            child:  Text(
                loadedproduct.description,
                textAlign: TextAlign.center,softWrap: true,
                ),
          
       ), ],),
      ),
    );
  }
}
