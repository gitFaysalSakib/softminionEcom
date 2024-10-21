import 'package:get/get.dart';

class HomePageProductItemModel {
  HomePageProductItemModel({
    required this.image,
    required this.showNewTextOrDiscountPrice,
    required this.ratingNumber,
    required this.brandName,
    required this.item,
    required this.newPrice,
    required this.id,
    required this.demoText,
  });

  final Rx<String> image;
  Rx<String>? showNewTextOrDiscountPrice;

  Rx<String>? ratingNumber;
  Rx<String>? brandName;
  Rx<String>? item;
  Rx<String>? newPrice;
  Rx<String>? id;
  Rx<String>? demoText;
}
