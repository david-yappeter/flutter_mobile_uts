import 'package:shoppp/models/cart.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;
  final String note;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
    required this.note,
  });
}
