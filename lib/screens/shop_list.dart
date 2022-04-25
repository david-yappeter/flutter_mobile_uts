import 'package:flutter/material.dart';
import 'package:shoppp/widgets/drawer.dart';

/*
  List Item di shop
*/
class ShopListScreen extends StatelessWidget {
  static const routeName = '/';
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop List'),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
