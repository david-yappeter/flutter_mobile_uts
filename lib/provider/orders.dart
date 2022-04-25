import 'package:flutter/material.dart';
import 'package:shoppp/models/order.dart';

class Orders with ChangeNotifier {
  final List<Order> _nodes = [];

  List<Order> get orders {
    return [..._nodes];
  }

  int get itemCount => _nodes.length;

  double get totalAmount => _nodes.fold(0.0, (sum, item) => sum + item.amount);

  void addOrder(Order order) {
    _nodes.insert(0, order);
    notifyListeners();
  }
}
