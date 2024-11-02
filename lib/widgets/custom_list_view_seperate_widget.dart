
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:get/get.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
// import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';

// class CustomProductListView extends StatelessWidget {
//   // final HomePageScrenController homePageScrenController =
//   //     Get.put(HomePageScrenController());

//   // Accept a builder function for the item widget
//   final Widget Function(BuildContext, HomePageProductItemModel) itemBuilder;

//   CustomProductListView({required this.itemBuilder});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => SizedBox(
//         height: 300.h,
//         width: double.infinity, // Adjust the height according to your need
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 0.h),
//           child: AnimationLimiter(
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               physics: BouncingScrollPhysics(), // Custom scroll behavior
//               separatorBuilder: (context, index) {
//                 return SizedBox(
//                   width: 16.h,
//                 );
//               },
//               itemCount: homePageScrenController
//                   .homePageScreenModel.value.productCardItemList.length,
//               itemBuilder: (context, index) {
//                 HomePageProductItemModel model = homePageScrenController
//                     .homePageScreenModel.value.productCardItemList[index];
//                 return AnimationConfiguration.staggeredList(
//                   position: index,
//                   duration: const Duration(milliseconds: 700),
//                   child: SlideAnimation(
//                     verticalOffset: 50.0,
//                     child: FadeInAnimation(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 8.h),
//                         child: itemBuilder(context, model), // Use itemBuilder
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
