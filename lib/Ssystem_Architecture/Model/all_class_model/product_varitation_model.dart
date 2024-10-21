import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Import for Image

class ProductVariationModel {
  RxString id = ''.obs;
  RxString price = ''.obs;
  RxString regularPrice = ''.obs;
  Rx<Image> image = Rx<Image>(Image());
  RxList<Attributes> attributes = <Attributes>[].obs;

  ProductVariationModel({
    String? id,
    String? price,
    String? regularPrice,
    Image? image,
    List<Attributes>? attributes,
  }) {
    this.id.value = id ?? '';
    this.price.value = price ?? '';
    this.regularPrice.value = regularPrice ?? '';
    this.image.value = image ?? Image();
    this.attributes.value = attributes ?? <Attributes>[];
  }

  ProductVariationModel.fromJson(Map<String, dynamic> json) {
    id.value = (json['id'] ?? '').toString(); // Ensure id is a string
    price.value = (json['price'] ?? '').toString(); // Ensure price is a string
    regularPrice.value = (json['regular_price'] ?? '')
        .toString(); // Ensure regularPrice is a string
    image.value =
        json['image'] != null ? Image.fromJson(json['image']) : Image();
    if (json['attributes'] != null) {
      json['attributes'].forEach((v) {
        attributes.add(Attributes.fromJson(v));
      });
    }
  }
}

class Image {
  RxInt id = 0.obs;
  RxString src = ''.obs;
  RxString name = ''.obs;
  RxString alt = ''.obs;

  Image({
    int? id,
    String? src,
    String? name,
    String? alt,
  }) {
    this.id.value = id ?? 0;
    this.src.value = src ?? '';
    this.name.value = name ?? '';
    this.alt.value = alt ?? '';
  }

  Image.fromJson(Map<String, dynamic> json) {
    id.value = json['id'] ?? 0;
    src.value = json['src'] ?? '';
    name.value = json['name'] ?? '';
    alt.value = json['alt'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id.value;
    data['src'] = src.value;
    data['name'] = name.value;
    data['alt'] = alt.value;
    return data;
  }
}

class Attributes {
  RxString name = ''.obs;
  RxString option = ''.obs;

  Attributes({
    String? name,
    String? option,
  }) {
    this.name.value = name ?? '';
    this.option.value = option ?? '';
  }

  Attributes.fromJson(Map<String, dynamic> json) {
    name.value = json['name'] ?? '';
    option.value = json['option'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name.value;
    data['option'] = option.value;
    return data;
  }
}
