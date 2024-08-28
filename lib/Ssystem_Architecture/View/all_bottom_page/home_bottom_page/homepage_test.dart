// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:softminion/Core/utils/image_constant.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
// import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/RND%20Page/home_product_item_show_screen.dart';
// import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/demo_product_card_details.dart';
// import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/home_screen_product_card_item.dart';
// import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_bottom_screen_page.dart';
// import 'package:softminion/Ssystem_Architecture/View/product_details_card/product_details_card.dart';
// import 'package:softminion/all_test_class.dart';
// import 'package:softminion/widgets/custom_image_view.dart';
// import 'package:softminion/widgets/custom_button_field.dart';
// import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
// import 'package:softminion/widgets/custom_list_view_seperate_widget.dart';
// import 'package:softminion/widgets/main_custom_list_view_builder.dart';

// class HomeBottomScreenTest extends StatelessWidget {
//   HomeBottomScreenTest({
//     Key? key,
//   }) : super(key: key);

//   final HomePageScrenController homePageScrenController =
//       Get.put(HomePageScrenController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildImageView(context),
//               SizedBox(height: 20.h),
//               _buildSubtitleWithProductView(),
//               //  _buildSubtitleWithProductViewTest(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSubtitleWithProductView() {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(horizontal: 14.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomProductListViewNew<HomePageProductItemModel>(
//             items: homePageScrenController
//                 .homePageScreenModel.value.productCardItemList,
//             itemBuilder: (context, model) {
//               return TestDEMOProductcardItemWidget(
//                 model,
//                 showORnotShowWidgets: true,
//               );
//             },
//             onItemTap: (homeProductModel) {
//               Get.to(() => TestDEMOProductcardItemWidget(
//                     homeProductModel,
//                     isSingleProductView: true,
//                     showORnotShowWidgets: false,
//                   ));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSubtitleWithProductViewTest() {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(horizontal: 14.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomProductListViewNew<HomePageProductItemModel>(
//             items: homePageScrenController
//                 .homePageScreenModel.value.productCardItemList,
//             itemBuilder: (context, model) {
//               return TestDEMOProductcardItemWidget(
//                 model,
//                 showORnotShowWidgets: true,
//               );
//             },
//             onItemTap: (homeProductModel) {
//               Get.to(() => TestDEMOProductcardItemWidget(
//                     homeProductModel,
//                     isSingleProductView: true,
//                     showORnotShowWidgets: false,
//                   ));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildImageView(BuildContext context) {
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         CustomImageView(
//           imagePath: ImageConstant.homePageImage,
//           width: double.infinity,
//         ),
//         Container(
//           padding: EdgeInsets.only(left: 10.h, top: 100.h),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 200.h),
//               Padding(
//                 padding: EdgeInsets.only(left: 4.h),
//                 child: Text(
//                   'Fashion Sale',
//                   maxLines: 2,
//                   style: TextStyle(
//                     fontSize: 50.w,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 18.h),
//               _buildCheckButton(context),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCheckButton(BuildContext context) {
//     // Add your implementation for _buildCheckButton here
//     return Container(); // Placeholder
//   }
// }
