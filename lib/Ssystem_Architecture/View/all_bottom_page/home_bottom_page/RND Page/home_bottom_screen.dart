// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:softminion/Core/utils/image_constant.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
// import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
// import 'package:softminion/Ssystem_Architecture/Model/home_page_screen_model.dart';
// import 'package:softminion/widgets/custom_image_view.dart';
// import 'package:softminion/widgets/custom_text_field.dart';

// import '../../../../widgets/custom_button_field.dart';
// import 'home_product_item_show_screen.dart';

// class HomeBottomScreen extends StatelessWidget {
//   HomeBottomScreen({Key? key}) : super(key: key);

//   final HomePageScrenController homePageScrenController =
//       Get.put(HomePageScrenController());

//   @override
//   Widget build(BuildContext context) {
//     print("home bottom screen");
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 // padding: EdgeInsets.only(
//                 //   bottom: MediaQuery.of(context).viewInsets.bottom,
//                 // ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       //  height: 492.h,
//                       width: double.infinity,
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           //  _buildCheckButton(context),

//                           _buildimageView(context),

//                           SizedBox(
//                             //height: 492.h,
//                             width: double.infinity,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: Container(
//                                     width: double.infinity,
//                                     padding: EdgeInsets.only(
//                                       left: 10.h,
//                                       top: 32.h,
//                                       bottom: 32.h,
//                                     ),
//                                     // decoration:
//                                     //    AppDecoration.gradientBlackToBlack,
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(height: 200.h),
//                                         Padding(
//                                             padding: EdgeInsets.only(left: 4.h),
//                                             child: Text('Fashion Sale',
//                                                 maxLines: 2,
//                                                 style: TextStyle(
//                                                   fontSize: 50.w,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontStyle: FontStyle.normal,
//                                                   color: Colors.white,
//                                                 ))),
//                                         SizedBox(height: 18.h),
//                                         _buildCheckButton(context)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     _buildColumnSubtitle(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildColumnSubtitle() {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.only(
//         left: 14.h,
//         right: 6.h,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "New",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 40),
//                             ),
//                             SizedBox(height: 2.h),
//                             Text(
//                               "You've never seen it befor!",
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 88, 87, 87),
//                                   fontSize: 10),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 22.h),
//                 Obx(
//                   () => ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     separatorBuilder: (context, index) {
//                       return SizedBox(
//                         width: 16.h,
//                       );
//                     },
//                     itemCount: homePageScrenController.homePageScreenModel.value
//                         .productCardItemList.value.length,
//                     itemBuilder: (context, index) {
//                       HomePageProductItemModel model = homePageScrenController
//                           .homePageScreenModel
//                           .value
//                           .productCardItemList
//                           .value[index];
//                       print("item list");
//                       return ProductcardItemWidget(model);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _buildimageView(BuildContext context) {
//   return CustomImageView(
//     imagePath: ImageConstant.homePageImage,
//     //height: 500.h,
//     width: double.infinity,
//     alignment: Alignment.topCenter,
//   );
// }

// Widget _buildCheckButton(BuildContext context) {
//   return CustomButton(
//     // backgroundColor: Colors.black,
//     textStyle: TextStyle(
//         fontSize: 15.h, color: Colors.white, fontWeight: FontWeight.bold),
//     height: 40.h,
//     width: 160.w,
//     isLoading: false,
//     text: "Check",
//     onPressed: () {
//       Get.back();
//     },
//   );
// }
