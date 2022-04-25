class Cart {
  final String id;
  final String name;
  final String shortDesc;
  final String assetImage;
  final int quantity;
  final double pricePerUnit;

  Cart({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.assetImage,
    required this.quantity,
    required this.pricePerUnit,
  });

  double get totalPrice {
    return pricePerUnit * quantity;
  }
}
