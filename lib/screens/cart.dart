import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppp/models/order.dart';
import 'package:shoppp/provider/carts.dart';
import 'package:shoppp/provider/orders.dart';

class CartScreen extends StatelessWidget {
  final _noteController = TextEditingController();
  static const routeName = '/cart';
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Carts>(context).carts;
    final totalAmount = Provider.of<Carts>(context).totalAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (BuildContext context, int idx) {
                      final currentCart = cartItems.values.toList()[idx];
                      return Dismissible(
                        key: Key(currentCart.id),
                        background: Container(
                          color: Theme.of(context).errorColor,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 40,
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          Provider.of<Carts>(context, listen: false)
                              .removeItem(currentCart.id);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: FittedBox(
                                    child: Image.asset(currentCart.assetImage),
                                  ),
                                ),
                              ),
                              title: Text(currentCart.name),
                              subtitle:
                                  Text('Total: Rp. ${currentCart.totalPrice}'),
                              trailing: Text('${currentCart.quantity} x'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextField(
                  controller: _noteController,
                  decoration: const InputDecoration(
                    labelText: 'Note for the shop',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Amount',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(totalAmount.toStringAsFixed(2),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(
                      Order(
                        id: DateTime.now().toString(),
                        amount: totalAmount,
                        products:
                            cartItems.values.map((value) => value).toList(),
                        dateTime: DateTime.now(),
                        note: _noteController.value.toString(),
                      ),
                    );
                    Provider.of<Carts>(context, listen: false).clear();
                    _noteController.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Center(
                    child: Text('Checkout'),
                  ),
                ),
              ],
            )
          : const Center(
              child: Text('Your cart is empty'),
            ),
    );
  }
}
