import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import '../providers/orders.dart';
import '../providers/orders.dart' as ot;

class OrderItem extends StatefulWidget {
  final ot.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _Expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_Expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _Expanded =! _Expanded;
                });
              },
            ),
          ),
          if (_Expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products
                .map(
                  (prod) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          prod.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${prod.quantity}x \$${prod.price}',
                        style:TextStyle(
                          fontSize:18,
                          color:Colors.grey,
                          ),
                     ),   ],
                    ),).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
