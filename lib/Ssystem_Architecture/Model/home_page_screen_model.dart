import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';

import 'home_page_product_connect_home_page_model.dart';

/// This class defines the variables used in the [main_page],
/// and is typically used to hold data that is passed between different parts of the app
/// ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable
class HomePageScreenModel {
  Rx<List<HomePageProductConnectHomePageModel>> productcardItemList = Rx([
    HomePageProductConnectHomePageModel(
        image: ImageConstant.homePage2.obs,
        image1: ImageConstant.homePage3.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs),
    HomePageProductConnectHomePageModel(
        image: ImageConstant.homePage2.obs,
        brandName: "Mango Boy".obs,
        item: "T-Shirt Sailing".obs,
        newPrice: "10\$".obs),
    HomePageProductConnectHomePageModel(
        image: ImageConstant.homepage1.obs,
        brandName: "Cool ".obs,
        item: "Jeans".obs,
        newPrice: "45\$".obs)
  ]);
}
