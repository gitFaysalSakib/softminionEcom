// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:softminion/Core/utils/size_utils.dart';
// // import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
// // import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
// // import 'package:softminion/widgets/custom_bottom_button_navigator.dart';
// // import 'package:softminion/widgets/custom_bottom_sheet_content.dart';
// // import 'package:softminion/widgets/custom_image_view.dart';

// // class TestDEMOProductcardItemWidget extends StatefulWidget {
// //   final HomePageProductItemModel homeProductModel;
// //   final bool isSingleProductView;
// //   final bool showORnotShowWidgets;
// //   final bool showProductDetailsPageDeliverySection;
// //   final bool buyOrAddCartButtonShow;

// //   TestDEMOProductcardItemWidget(
// //     this.homeProductModel, {
// //     Key? key,
// //     this.isSingleProductView = false,
// //     this.showORnotShowWidgets = true,
// //     this.showProductDetailsPageDeliverySection = true,
// //     this.buyOrAddCartButtonShow = false,
// //   }) : super(key: key);

// //   @override
// //   State<TestDEMOProductcardItemWidget> createState() =>
// //       _TestDEMOProductcardItemWidgetState();
// // }

// // class _TestDEMOProductcardItemWidgetState
// //     extends State<TestDEMOProductcardItemWidget>
// //     with SingleTickerProviderStateMixin {
// //   final HomePageScrenController homePageScrenController =
// //       Get.put(HomePageScrenController());

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return widget.isSingleProductView
// //         ? SafeArea(
// //             child: Scaffold(
// //               appBar: AppBar(
// //                 leading: IconButton(
// //                   icon: Icon(Icons.arrow_back),
// //                   onPressed: () {
// //                     Get.back();
// //                   },
// //                 ),
// //               ),
// //               body: Column(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Expanded(
// //                     child: SingleChildScrollView(
// //                       child: _buildAllContentSeparateFromScaffold(context),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           )
// //         : _buildAllContentSeparateFromScaffold(context);
// //   }

// //   Widget _buildAllContentSeparateFromScaffold(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         // Main Content

// //         Container(
// //           width: widget.isSingleProductView ? double.infinity : 150.h,
// //           color: widget.isSingleProductView ? Colors.white : null,
// //           child: Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Image Section
// //                 Container(
// //                   padding: widget.isSingleProductView
// //                       ? EdgeInsets.only(top: 0.0)
// //                       : EdgeInsets.zero,
// //                   height: widget.isSingleProductView ? 400.h : 200.h,
// //                   width: double.infinity,
// //                   child: Stack(
// //                     alignment: Alignment.center,
// //                     children: [
// //                       Obx(
// //                         () => CustomImageView(
// //                           imagePath: widget.homeProductModel.image.value,
// //                           height: double.infinity,
// //                           width: double.infinity,
// //                           radius: BorderRadius.circular(4.h),
// //                         ),
// //                       ),
// //                       if (widget.showORnotShowWidgets &&
// //                           widget.homeProductModel.showNewTextOrDiscountPrice !=
// //                               null)
// //                         Align(
// //                           alignment: Alignment.topLeft,
// //                           child: Container(
// //                             decoration: BoxDecoration(
// //                               color: Colors.black,
// //                               borderRadius: BorderRadius.only(
// //                                 topLeft: Radius.circular(8.0),
// //                                 bottomRight: Radius.circular(8.0),
// //                               ),
// //                             ),
// //                             padding: EdgeInsets.symmetric(
// //                                 horizontal: 8.0, vertical: 4.0),
// //                             child: Obx(
// //                               () => Text(
// //                                 widget.homeProductModel
// //                                     .showNewTextOrDiscountPrice!.value,
// //                                 style: TextStyle(
// //                                   fontSize: 12.0,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Colors.white,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       if (widget.showORnotShowWidgets)
// //                         Positioned(
// //                           bottom: 8.0,
// //                           right: 8.0,
// //                           child: Container(
// //                             decoration: BoxDecoration(
// //                               color: Colors.black,
// //                               shape: BoxShape.circle,
// //                             ),
// //                             padding: EdgeInsets.all(8.0),
// //                             child: Icon(
// //                               Icons.favorite_border,
// //                               color: Colors.grey,
// //                               size: 15.0,
// //                             ),
// //                           ),
// //                         ),
// //                     ],
// //                   ),
// //                 ),
// //                 // Product Details Section

// //                 Padding(
// //                   padding: widget.isSingleProductView
// //                       ? EdgeInsets.only(left: 20.h, top: 10.h)
// //                       : EdgeInsets.only(top: 8.h),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Row(
// //                         children: [
// //                           Image.asset(
// //                             'assets/images/money.png',
// //                             color: Colors.red,
// //                             height: widget.isSingleProductView ? 12.h : 14.h,
// //                             width: widget.isSingleProductView ? 25.h : 14.h,
// //                           ),
// //                           SizedBox(width: 5.w),
// //                           Text(
// //                             "30",
// //                             style: TextStyle(
// //                               fontSize:
// //                                   widget.isSingleProductView ? 20.h : 14.h,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.red,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       if (widget.isSingleProductView)
// //                         Text(
// //                           "ART",
// //                           style: TextStyle(
// //                             fontSize: widget.isSingleProductView ? 15.h : 10.h,
// //                             color: Colors.black,
// //                             fontWeight: FontWeight.normal,
// //                           ),
// //                         ),
// //                       if (widget.isSingleProductView) SizedBox(height: 10.h),
// //                       Text(
// //                         widget.isSingleProductView
// //                             ? "Premium Quality - stylish new T Shirt - casual Exclusive Half sleeve T shirt Men - Tshirt"
// //                             : " T Shirt ",
// //                         style: TextStyle(
// //                           fontSize: widget.isSingleProductView ? 14.h : 16.h,
// //                           color: Colors.black,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       if (widget.isSingleProductView) SizedBox(height: 10.h),
// //                       Text(
// //                         widget.homeProductModel.demoText!.value,
// //                         style: TextStyle(
// //                           fontSize: widget.isSingleProductView ? 15.h : 10.h,
// //                           color: widget.isSingleProductView
// //                               ? Colors.grey
// //                               : Colors.black,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),

// //                       Text(
// //                         "Free Delivery",
// //                         style: TextStyle(
// //                           fontSize: widget.isSingleProductView ? 15.h : 12.h,
// //                           color: Colors.green,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       Text(
// //                         "Free Delivery",
// //                         style: TextStyle(
// //                           fontSize: widget.isSingleProductView ? 15.h : 12.h,
// //                           color: Colors.green,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       Text(
// //                         "Free Delivery",
// //                         style: TextStyle(
// //                           fontSize: widget.isSingleProductView ? 15.h : 12.h,
// //                           color: Colors.green,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       Text(
// //                         "Free Delivery",
// //                         style: TextStyle(
// //                           fontSize: widget.isSingleProductView ? 15.h : 12.h,
// //                           color: Colors.green,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),

// //                       // ... Add more delivery texts or widgets if needed
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// ////////////////
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
// import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
// import 'package:softminion/widgets/custom_image_view.dart';

// class TestDEMOProductcardItemWidget extends StatefulWidget {
//   final HomePageProductItemModel homeProductModel;
//   final bool isSingleProductView;
//   final bool showORnotShowWidgets;
//   final bool showProductDetailsPageDeliverySection;
//   final bool buyOrAddCartButtonShow;

//   TestDEMOProductcardItemWidget(
//     this.homeProductModel, {
//     Key? key,
//     this.isSingleProductView = false,
//     this.showORnotShowWidgets = true,
//     this.showProductDetailsPageDeliverySection = true,
//     this.buyOrAddCartButtonShow = false,
//   }) : super(key: key);

//   @override
//   State<TestDEMOProductcardItemWidget> createState() =>
//       _TestDEMOProductcardItemWidgetState();
// }

// class _TestDEMOProductcardItemWidgetState
//     extends State<TestDEMOProductcardItemWidget>
//     with SingleTickerProviderStateMixin {
//   final HomePageScrenController homePageScrenController =
//       Get.put(HomePageScrenController());

//   @override
//   Widget build(BuildContext context) {
//     return _buildAllContentSeparateFromScaffold(context);
//   }

//   Widget _buildAllContentSeparateFromScaffold(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildImageAndDetails(context),
//         if (widget.isSingleProductView) _buildFullProductDetails(context),
//       ],
//     );
//   }

//   Widget _buildImageAndDetails(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: widget.isSingleProductView ? double.infinity : 150.h,
//           color: widget.isSingleProductView ? Colors.white : null,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildProductImage(),
//               _buildTextSection(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildProductImage() {
//     return Container(
//       padding: widget.isSingleProductView
//           ? EdgeInsets.only(top: 0.0)
//           : EdgeInsets.zero,
//       height: widget.isSingleProductView ? 400.h : 200.h,
//       width: double.infinity,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Obx(
//             () => CustomImageView(
//               imagePath: widget.homeProductModel.image.value,
//               height: double.infinity,
//               width: double.infinity,
//               radius: BorderRadius.circular(4.h),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextSection() {
//     return Padding(
//       padding: widget.isSingleProductView
//           ? EdgeInsets.only(left: 20.h, top: 10.h)
//           : EdgeInsets.only(top: 8.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Flexible(
//             child: Text(
//               "Product Title", // Replace with actual product title
//               style: TextStyle(
//                 fontSize: widget.isSingleProductView ? 20.h : 16.h,
//                 fontWeight: FontWeight.bold,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           SizedBox(height: 8.h), // Add spacing between text items
//           Flexible(
//             child: Text(
//               "Product Subtitle or More Text", // Replace with actual product subtitle
//               style: TextStyle(
//                 fontSize: widget.isSingleProductView ? 20.h : 16.h,
//                 fontWeight: FontWeight.bold,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFullProductDetails(BuildContext context) {
//     return Flexible(
//       // Use Flexible instead of Expanded to avoid layout issues
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20.h),
//             Text(
//               "Full Product Details",
//               style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10.h),
//             Text(
//               "Detailed information about the product goes here...",
//               style: TextStyle(fontSize: 16.h),
//             ),
//             // Add more detailed product information here
//             SizedBox(height: 10.h),
//           ],
//         ),
//       ),
//     );
//   }
// }
