// lib/models/category.dart
class Category {
  final String name;
  final String? image;
  final List<SubCategory> subCategories;

  Category({
    required this.name,
    this.image,
    required this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      image: json['image'],
      subCategories: (json['subCategories'] as List)
          .map((item) => SubCategory.fromJson(item))
          .toList(),
    );
  }
}

class SubCategory {
  final String name;
  final String? image;
  final List<SubProduct> subProducts;

  SubCategory({
    required this.name,
    this.image,
    required this.subProducts,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      name: json['name'],
      image: json['image'],
      subProducts: (json['subProducts'] as List)
          .map((item) => SubProduct.fromJson(item))
          .toList(),
    );
  }
}

class SubProduct {
  final String name;
  final String? image;

  SubProduct({
    required this.name,
    this.image,
  });

  factory SubProduct.fromJson(Map<String, dynamic> json) {
    return SubProduct(
      name: json['name'],
      image: json['image'],
    );
  }
}
