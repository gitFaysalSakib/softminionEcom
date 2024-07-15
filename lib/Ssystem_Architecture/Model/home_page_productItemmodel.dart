import 'package:get/get.dart';

import '../../Core/utils/image_constant.dart';

/// This class is used in the [productcard_item_widget] screen.
// ignore_for_file: must_be_immutable
class HomePageProductConnectHomePageModel {
  HomePageProductConnectHomePageModel(
      {this.image,
      this.image1,
      this.ratingNumber,
      this.brandName,
      this.item,
      this.newPrice,
      this.id}) {
    image = image ?? Rx(ImageConstant.homePage2);
    image1 = image1 ?? Rx(ImageConstant.homepage1);
    ratingNumber = ratingNumber ?? Rx("(0)");
    brandName = brandName ?? Rx("OVS");
    item = item ?? Rx("Blouse");
    newPrice = newPrice ?? Rx("30\$");
    id = id ?? Rx("");
  }
  Rx<String>? image;
  Rx<String>? image1;
  Rx<String>? ratingNumber;
  Rx<String>? brandName;
  Rx<String>? item;
  Rx<String>? newPrice;
  Rx<String>? id;
}
