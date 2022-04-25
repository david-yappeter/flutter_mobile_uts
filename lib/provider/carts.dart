import 'package:flutter/material.dart';
import 'package:shoppp/models/cart.dart';

class Carts with ChangeNotifier {
  Map<String, Cart> _nodes = {};

  Map<String, Cart> get carts {
    return {..._nodes};
  }

  int get itemCount => _nodes.length;

  double get totalAmount =>
      _nodes.values.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addItem(Cart node) {
    if (_nodes.containsKey(node.id)) {
      _nodes.update(
        node.id,
        (existingNode) => Cart(
          id: existingNode.id,
          name: existingNode.name,
          assetImage: existingNode.assetImage,
          shortDesc: existingNode.shortDesc,
          pricePerUnit: existingNode.pricePerUnit,
          quantity: existingNode.quantity + 1,
        ),
      );
    } else {
      _nodes.putIfAbsent(
        node.id,
        () => node,
      );
    }
    notifyListeners();
  }

  void removeItem(String cartId) {
    _nodes.remove(cartId);
    notifyListeners();
  }

  void clear() {
    _nodes = {};
    notifyListeners();
  }
}
