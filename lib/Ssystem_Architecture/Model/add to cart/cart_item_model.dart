class CartItem {
  String title;
  String imageUrl;
  String color;
  String size;
  double price;
  bool isSelected;
  int quantity;

  CartItem({
    required this.title,
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.price,
    this.isSelected = false,
    this.quantity = 1, // Default quantity set to 1
  });
}
