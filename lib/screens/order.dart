import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppp/provider/orders.dart';
import 'package:shoppp/widgets/drawer.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderItems = Provider.of<Orders>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      drawer: const CustomDrawer(),
      body: orderItems.isNotEmpty
          ? ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (BuildContext ctx, int idx) {
                final currentOrder = orderItems[idx];
                return ExpansionTile(
                  title: Text('Rp. ${currentOrder.amount.toString()}'),
                  subtitle: Text(
                    DateFormat('dd/MMM/yyyy hh:mm')
                        .format(currentOrder.dateTime),
                  ),
                  children: currentOrder.products
                      .map(
                        (e) => ListTile(
                          title: Text(e.name),
                          subtitle: Text(e.shortDesc),
                          leading: Image.asset(e.assetImage, fit: BoxFit.cover),
                          trailing: Text('Rp. ${e.totalPrice}'),
                        ),
                      )
                      .toList(),
                );
              },
            )
          : const Center(
              child: Text('No orders yet'),
            ),
    );
  }
}
