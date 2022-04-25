import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppp/models/cart.dart';
import 'package:shoppp/models/product.dart';
import 'package:shoppp/provider/carts.dart';
import 'package:shoppp/screens/cart.dart';
import 'package:shoppp/widgets/drawer.dart';

/*
  List Item di shop
*/
class ShopListScreen extends StatelessWidget {
  static const routeName = '/';
  ShopListScreen({Key? key}) : super(key: key);

  final List<Product> productList = [
    Product(
      id: '1',
      name: '[FS] Logitech Wireless Mouse M191',
      shortDesc:
          'full-size wireless mouse dengan desain kontur nyaman yang mengikuti lekukan alami tangan berukuran sedang hingga besar',
      assetImage: 'assets/images/product1.jpg',
      price: 109000.0,
    ),
    Product(
      id: '2',
      name: 'Logitech G613',
      shortDesc:
          'wireless keyboard generasi terbaru yang dirancang untuk gamer yang menuntut kemampuan switch mechanical berkinerja tinggi dan kebebasan wireless gaming',
      assetImage: 'assets/images/product2.jpg',
      price: 1200000.0,
    ),
    Product(
      id: '3',
      name: 'Mouse 3',
      shortDesc: 'Mouse pertama',
      assetImage: 'assets/images/product1.jpg',
      price: 50000.0,
    ),
    Product(
      id: '4',
      name: 'Keyboard 3',
      shortDesc: 'Keyboard kedua',
      assetImage: 'assets/images/product2.jpg',
      price: 100000.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: productList
            .map(
              (e) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(e.name),
                      subtitle: Text(e.shortDesc),
                      leading: Image.asset(e.assetImage, fit: BoxFit.cover),
                      trailing: Text('Rp. ${e.price.toStringAsFixed(0)}'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Provider.of<Carts>(context, listen: false).addItem(
                              Cart(
                                id: e.id,
                                name: e.name,
                                shortDesc: e.shortDesc,
                                assetImage: e.assetImage,
                                quantity: 1,
                                pricePerUnit: e.price,
                              ),
                            );

                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Added to cart'),
                                action: SnackBarAction(
                                  label: 'Ok',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                          child: const Text('Add to cart'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
