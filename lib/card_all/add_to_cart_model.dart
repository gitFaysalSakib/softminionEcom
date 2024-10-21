class CartItemLocalStorageModel {
  final String productID;
  final String variationID;

  final String categoryID;
  final String categoryName;

  final String title;
  final List<String> imageUrls;
  final double total;
  late final bool isSelected;
  late final int quantity;
  final Map<String, String> selectedAttributes;
  final Map<String, String> selectedAttributesWithID;

  CartItemLocalStorageModel({
    required this.productID,
    required this.variationID,
    required this.categoryID,
    required this.categoryName,
    required this.title,
    required this.imageUrls,
    required this.total,
    this.isSelected = false,
    this.quantity = 1,
    required this.selectedAttributes,
    required this.selectedAttributesWithID,
  });

  // CopyWith method
  CartItemLocalStorageModel copyWith({
    String? productID,
    String? variationID,
    String? categoryID,
    String? categoryName,
    String? title,
    List<String>? imageUrls,
    double? total,
    bool? isSelected,
    int? quantity,
    Map<String, String>? selectedAttributes,
    Map<String, String>? selectedAttributesWithID,
  }) {
    return CartItemLocalStorageModel(
      productID: productID ?? this.productID,
      variationID: variationID ?? this.variationID,
      categoryID: categoryID ?? this.categoryID,
      categoryName: categoryName ?? this.categoryName,
      title: title ?? this.title,
      imageUrls: imageUrls ?? this.imageUrls,
      total: total ?? this.total,
      isSelected: isSelected ?? this.isSelected,
      quantity: quantity ?? this.quantity,
      selectedAttributes: selectedAttributes ?? this.selectedAttributes,
      selectedAttributesWithID:
          selectedAttributesWithID ?? this.selectedAttributesWithID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'proId': productID,
      'variationId': variationID,

      'cateId': categoryID,
      'name': categoryName,
      'title': title,
      'imageUrls': imageUrls, // Correct field name
      'total': total,
      'isSelected': isSelected,
      'quantity': quantity,
      'selectedAttributes': selectedAttributes,
      'selectedAttributesWithID': selectedAttributesWithID,
    };
  }

// Create a CartItem from a Map (when retrieving)
  factory CartItemLocalStorageModel.fromMap(Map<String, dynamic> map) {
    return CartItemLocalStorageModel(
      productID: map['proId'],
      variationID: map['variationId'],

      categoryID: map['cateId'],
      categoryName: map['name'],

      title: map['title'],
      imageUrls:
          List<String>.from(map['imageUrls'] ?? []), // Consistent field name
      total: map['total'],
      isSelected: map['isSelected'] ?? false,
      quantity: map['quantity'] ?? 1,
      selectedAttributes:
          Map<String, String>.from(map['selectedAttributes'] ?? {}),

      selectedAttributesWithID:
          Map<String, String>.from(map['selectedAttributesWithID'] ?? {}),
    );
  }
}
