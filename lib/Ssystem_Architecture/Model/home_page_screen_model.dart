// import 'package:get/get.dart';
// import 'package:softminion/Core/utils/image_constant.dart';

// import 'home_page_productItemmodel.dart';

// /// This class defines the variables used in the [main_page],
// /// and is typically used to hold data that is passed between different parts of the app
// /// ignore_for_file: must_be_immutable
// // ignore_for_file: must_be_immutable
// class HomePageScreenModel {
//   Rx<List<HomePageProductitemmodel>> productcardItemList = Rx([
//     HomePageProductitemmodel(
//       image: ImageConstant.homePageImage1.obs,
//       //  image1: ImageConstant.homePage3.obs,
//       // ratingNumber: "(0)".obs,
//       brandName: "OVS".obs,
//       // item: "Blouse".obs,
//       // newPrice: "30\$".obs
//     ),
//     // HomePageProductitemmodel(
//     //   image: ImageConstant.homePage3.obs,
//     //   // brandName: "Mango Boy".obs,
//     //   // item: "T-Shirt Sailing".obs,
//     //   // newPrice: "10\$".obs
//     // ),
//     // HomePageProductitemmodel(
//     //   image: ImageConstant.homePageImage1.obs,
//     //   // brandName: "Cool ".obs,
//     //   // item: "Jeans".obs,
//     //   // newPrice: "45\$".obs
//     // )
//   ]);
// }
//
//// new code........
///

import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';
import 'home_page_productItemmodel.dart';

class HomePageScreenModel {
  HomePageScreenModel() {
    productCardItemList = [
      HomePageProductItemModel(
        image: ImageConstant.displayN6.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs,
        id: "".obs,
        showNewTextOrDiscountPrice: "NEW".obs,
        demoText: "3.4 (756)  | 13.9K sold".obs,
      ),
      HomePageProductItemModel(
        image: ImageConstant.card2.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs,
        id: "".obs,
        showNewTextOrDiscountPrice: "NEW".obs,
        demoText: "3.4 (756)  | 13.9K sold".obs,
      ),
      HomePageProductItemModel(
        image: ImageConstant.card2.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs,
        id: "".obs,
        showNewTextOrDiscountPrice: "NEW".obs,
        demoText: "3.4 (756)  | 13.9K sold".obs,
      ),
      HomePageProductItemModel(
        image: ImageConstant.homePageRed.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs,
        id: "".obs,
        showNewTextOrDiscountPrice: "NEW".obs,
        demoText: "3.4 (756)  | 13.9K sold".obs,
      ),
      HomePageProductItemModel(
        image: ImageConstant.homePageRed.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs,
        id: "".obs,
        showNewTextOrDiscountPrice: "NEW".obs,
        demoText: "3.4 (756)  | 13.9K sold".obs,
      ),
      HomePageProductItemModel(
        image: ImageConstant.homePageRed.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs,
        id: "".obs,
        showNewTextOrDiscountPrice: "NEW".obs,
        demoText: "3.4 (756)  | 13.9K sold".obs,
      ),
      HomePageProductItemModel(
        image: ImageConstant.homePageRed.obs,
        ratingNumber: "(0)".obs,
        brandName: "OVS".obs,
        item: "Blouse".obs,
        newPrice: "30\$".obs,
        id: "".obs,
        showNewTextOrDiscountPrice: "NEW".obs,
        demoText: "3.4 (756)  | 13.9K sold".obs,
      ),
    ].obs;
  }

  late final RxList<HomePageProductItemModel> productCardItemList;
}
