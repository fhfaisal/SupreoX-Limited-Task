class MenuItem {
  final String name;
  final double price;
  int quantity;
  final String imageUrl;

  MenuItem({
    required this.name,
    required this.price,
    this.quantity = 0,
    required this.imageUrl,
  });
}
