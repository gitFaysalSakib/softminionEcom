import 'package:get/get.dart';

class AllProductsListModel {
  AllProductsListModel({
    required this.id,
    required this.name,
    required this.status,
    required this.images,
    required this.price,
    required this.type,
    required this.attributes, // New field added for attributes
  });
  RxString id;
  RxString name;

  RxString status;
  RxList<Images> images;
  RxList<Category> type;

  RxInt price;
  RxList<Attributes> attributes; // New list for attributes

  // Factory constructor to map JSON data
  factory AllProductsListModel.fromJson(Map<String, dynamic> json) {
    return AllProductsListModel(
      id: (json['id'] ?? '').toString().obs,
      name: (json['name'] ?? '').toString().obs,
      status: (json['status'] ?? '').toString().obs,
      images: (json['images'] as List<dynamic>?)
              ?.map((imageJson) => Images.fromJson(imageJson))
              .toList()
              .obs ??
          <Images>[].obs,
      type: (json['categories'] as List<dynamic>?)
              ?.map((categoryJson) => Category.fromJson(categoryJson))
              .toList()
              .obs ??
          <Category>[].obs,
      price: ((json['price'] ?? 0) is int
              ? (json['price'] as int)
              : int.tryParse(json['price'].toString()) ?? 0)
          .obs,
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((attrJson) => Attributes.fromJson(attrJson))
              .toList()
              .obs ??
          <Attributes>[].obs,
    );
  }
}

class Attributes {
  RxString id;
  RxString name;
  RxList<String> options;

  Attributes({
    required this.id,
    required this.name,
    required this.options,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      name: (json['name'] ?? '').toString().obs,
      id: (json['id'] ?? '').toString().obs,

      // Use RxBool for boolean values
      // Use RxBool for boolean values
      options: (json['options'] as List<dynamic>)
          .map((option) => option.toString())
          .toList()
          .obs,
    );
  }
}

class Images {
  RxString imageLink;

  Images({String? imageLink})
      : imageLink = (imageLink ?? '').obs; // Initialize as empty string if null

  // Factory constructor to map JSON data
  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      imageLink: json['src'] as String?,
    );
  }
}

class Category {
  RxString id; // Reactive string for the category ID
  RxString categoryType; // Reactive string for the category type (name)

  // Constructor with optional parameters and reactive variables
  Category({
    required this.id,
    required this.categoryType,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: (json['id'] ?? '').toString().obs,
      categoryType: (json['name'] ?? '').toString().obs,
    );
  }
}
