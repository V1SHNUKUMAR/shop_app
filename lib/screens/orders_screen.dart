import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/order_item.dart';
import 'package:provider/provider.dart';

import 'package:flutter_complete_guide/providers/orders.dart' show Orders;

import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (BuildContext context, int index) {
          if (orderData.orders.length == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.data_array,
                  size: 50,
                  color: Colors.black,
                ),
                Text(
                  "No Orders",
                  style: TextStyle(fontSize: 20),
                )
              ],
            );
          }
          return OrderItem(orderData.orders[index]);
        },
      ),
    );
  }
}
