// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
// import 'package:softminion/buy_add_button_test.dart';
// import 'package:softminion/widgets/custom_bottom_button_navigator.dart';
// import 'package:softminion/widgets/custom_bottom_sheet_content.dart';
// import 'package:softminion/widgets/custom_icon.dart';
// import 'package:softminion/widgets/custom_image_view.dart';

// class DEMOProductcardItemWidget extends StatefulWidget {
//   final HomePageProductItemModel homeProductModel;
//   final bool isSingleProductView;
//   final bool showORnotShowWidgets;
//   final bool showProductDetailsPageDeliverySection;
//   final bool buyOrAddCartButtonShow;

//   DEMOProductcardItemWidget(
//     this.homeProductModel, {
//     Key? key,
//     this.isSingleProductView = false,
//     this.showORnotShowWidgets = true,
//     this.showProductDetailsPageDeliverySection = true,
//     this.buyOrAddCartButtonShow = false,
//   }) : super(key: key);

//   @override
//   State<DEMOProductcardItemWidget> createState() =>
//       _DEMOProductcardItemWidgetState();
// }

// class _DEMOProductcardItemWidgetState extends State<DEMOProductcardItemWidget> {
//   String?
//       lastClickedButton; // State variable to store the last clicked button text

//   void handleButtonClick(String buttonText) {
//     setState(() {
//       lastClickedButton =
//           buttonText; // Update the state with the clicked button text
//     });
//     if (buttonText == 'Buy Now') {
//       BuyandAddtoCartBottomButtonBar(onBuyNow: () {
//         // Action to be performed when 'Buy Now' is clicked.
//         // Leave empty if no action is needed.
//       });
//     } else if (buttonText == 'Add to Cart') {
//       //widget.onAddToCart();
//       BuyandAddtoCartBottomButtonBar(onAddToCart: () {
//         // Action to be performed when 'Buy Now' is clicked.
//         // Leave empty if no action is needed.
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.isSingleProductView
//         ? SafeArea(
//             child: Scaffold(
//               appBar: AppBar(
//                 leading: IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () {
//                     Get.back();
//                   },
//                 ),
//               ),
//               body: _buildAllContentSeparateFromScaffold(context),
//             ),
//           )
//         : _buildAllContentSeparateFromScaffold(context);
//   }

//   Widget _buildAllContentSeparateFromScaffold(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Main Content
//         Expanded(
//           child: Container(
//             height: widget.isSingleProductView ? null : 266.h,
//             width: widget.isSingleProductView ? double.infinity : 150.h,
//             color: widget.isSingleProductView ? Colors.white : null,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image Section
//                 Container(
//                   padding: widget.isSingleProductView
//                       ? EdgeInsets.only(
//                           top: 0.0,
//                         )
//                       : EdgeInsets.zero,
//                   height: widget.isSingleProductView ? 400.h : 160.h,
//                   width: double.infinity,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Obx(
//                         () => CustomImageView(
//                           imagePath: widget.homeProductModel.image.value,
//                           height: double.infinity,
//                           width: double.infinity,
//                           radius: BorderRadius.circular(4.h),
//                         ),
//                       ),
//                       if (widget.showORnotShowWidgets)
//                         if (widget
//                                 .homeProductModel.showNewTextOrDiscountPrice !=
//                             null)
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0),
//                                 ),
//                               ),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8.0, vertical: 4.0),
//                               child: Obx(
//                                 () => Text(
//                                   widget.homeProductModel
//                                       .showNewTextOrDiscountPrice!.value,
//                                   style: TextStyle(
//                                     fontSize: 12.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                       if (widget.showORnotShowWidgets)
//                         Positioned(
//                           bottom: 8.0,
//                           right: 8.0,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               shape: BoxShape.circle,
//                             ),
//                             padding: EdgeInsets.all(8.0),
//                             child: Icon(
//                               Icons.favorite_border,
//                               color: Colors.grey,
//                               size: 15.0,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 // Product Details Section
//                 Padding(
//                   padding: widget.isSingleProductView
//                       ? EdgeInsets.only(left: 20.h, top: 10.h)
//                       : EdgeInsets.only(top: 8.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/images/money.png', // Path to your asset icon
//                             color: Colors
//                                 .red, // Set the color if the image supports colorization
//                             height: widget.isSingleProductView
//                                 ? 12.h
//                                 : 14.h, // Adjust height based on the view
//                             width: widget.isSingleProductView
//                                 ? 25.h
//                                 : 14.h, // Adjust width based on the view
//                           ),
//                           SizedBox(
//                               width: 5
//                                   .w), // Add some spacing between the icon and the text
//                           Text(
//                             "30",
//                             style: TextStyle(
//                               fontSize:
//                                   widget.isSingleProductView ? 20.h : 14.h,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ],
//                       ),
//                       //this OBX value design for when data comes to API.. NOW this code stop and use statice vale ...
//                       // Obx(() => Text(homeProductModel.newPrice!.value,
//                       //     style: TextStyle(
//                       //         fontSize: isSingleProductView ? 25.h : 14.h,
//                       //         fontWeight: FontWeight.bold,
//                       //         color: Colors.red))),
//                       // Obx(() => Text(homeProductModel.brandName!.value,
//                       //     style: TextStyle(
//                       //         fontSize: isSingleProductView ? 15.h : 10,
//                       //         color: Colors.black,
//                       //         fontWeight: FontWeight.normal))),
//                       // Obx(() => Text(homeProductModel.item!.value,
//                       //     style: TextStyle(
//                       //         fontSize: isSingleProductView ? 20.h : 16.h,
//                       //         color: Colors.black,
//                       //         fontWeight: FontWeight.bold))),
//                       // if (isSingleProductView)
//                       //   SizedBox(
//                       //     height: 10.h,
//                       //   ),
//                       // Obx(() => Text(homeProductModel.demoText!.value,
//                       //     style: TextStyle(
//                       //         fontSize: isSingleProductView ? 15.h : 10.h,
//                       //         color: isSingleProductView
//                       //             ? Colors.grey
//                       //             : Colors.black,
//                       //         fontWeight: FontWeight.bold))),

//                       //thic code use now statice vale.....

//                       if (widget.isSingleProductView == false)
//                         Text("ART",
//                             style: TextStyle(
//                                 fontSize:
//                                     widget.isSingleProductView ? 15.h : 10,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.normal)),
//                       if (widget.isSingleProductView)
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                       Text(
//                           widget.isSingleProductView
//                               ? "Premium Quality - stylish new T Shirt - calsual Exclusive Half sleeve T shirt Men - Tshirt"
//                               : " T Shirt ",
//                           style: TextStyle(
//                               fontSize:
//                                   widget.isSingleProductView ? 14.h : 16.h,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold)),
//                       if (widget.isSingleProductView)
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                       Text(widget.homeProductModel.demoText!.value,
//                           style: TextStyle(
//                               fontSize:
//                                   widget.isSingleProductView ? 15.h : 10.h,
//                               color: widget.isSingleProductView
//                                   ? Colors.grey
//                                   : Colors.black,
//                               fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ),
//                 if (widget.isSingleProductView)
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                 if (widget.isSingleProductView)
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 20.h,
//                       right: 20.h,
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(
//                           10.h), // Adjust the curvature here
//                       child: Container(
//                         padding: EdgeInsets.all(10.h),
//                         color: Colors.grey[
//                             100], // Set your desired background color here
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildIconWithText(
//                               icon: Icons.refresh,
//                               text: "7 Days Return",
//                             ),
//                             SizedBox(height: 20.h), // Add spacing between items
//                             _buildIconWithText(
//                               icon: Icons.local_shipping,
//                               text: "Free Shipping",
//                               subText: "On Orders Over \$50",
//                             ),
//                             SizedBox(height: 20.h), // Add spacing between items
//                             GestureDetector(
//                               onTap: () {
//                                 // showCustomLargeBottomSheet(context);
//                               },
//                               child: Container(
//                                 color: Colors
//                                     .transparent, // Ensure the entire area is clickable
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal:
//                                         0.0), // Adjust the padding as needed
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.category,
//                                       size: 15.h, // Adjust the size as needed
//                                     ),
//                                     SizedBox(
//                                         width: 8
//                                             .w), // Space between the icon and the first circle
//                                     Row(
//                                       children: [
//                                         _buildColorCircle(Colors.red),
//                                         SizedBox(
//                                             width: 4
//                                                 .w), // Space between the circles
//                                         _buildColorCircle(Colors.white,
//                                             border: Border.all(
//                                                 color: Colors.black)),
//                                         SizedBox(width: 4.w),
//                                         _buildColorCircle(Colors.blue),
//                                         SizedBox(width: 4.w),
//                                         _buildColorCircle(Colors.black),
//                                         SizedBox(width: 4.w),
//                                         _buildColorCircle(Colors.yellow),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )

// // Helper method to build a color circle
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//               ],
//             ),
//           ),
//         ),
//         // Bottom Button Bar
//         if (widget.isSingleProductView)
//           BuyandAddtoCartBottomButtonBar(
//             onBuyNow: () {
//               print("buyyyyyyyyyy");
//               showCustomLargeBottomSheet(context, true, false);
//             },
//             onAddToCart: () {
//               print("adddddddd");

//               showCustomLargeBottomSheet(context, false, true);
//             },
//           ),
//       ],
//     );
//   }
// }

// Widget _buildColorCircle(Color color, {Border? border}) {
//   return Container(
//     width: 16.h, // Adjust the size of the circle
//     height: 16.h,
//     decoration: BoxDecoration(
//       color: color,
//       shape: BoxShape.circle,
//       border: border, // Optional border
//     ),
//   );
// }

// Widget _buildIconWithText({
//   required IconData icon,
//   String? text,
//   String? subText,
// }) {
//   return Row(
//     children: [
//       Icon(
//         icon,
//         size: 15.h,
//         color: Colors.grey[700],
//       ),
//       SizedBox(width: 12.h), // Space between icon and text
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (text != null)
//             Text(
//               text,
//               style: TextStyle(
//                 fontSize: 14.h,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           if (subText != null)
//             Text(
//               subText,
//               style: TextStyle(
//                 fontSize: 10.h,
//                 color: Colors.grey[600],
//               ),
//             ),
//         ],
//       ),
//     ],
//   );
// }

/////////////
///
///
///
///
///
///
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';
import 'package:softminion/widgets/custom_bottom_sheet_content.dart';
import 'package:softminion/widgets/custom_image_view.dart';

class DEMOProductcardItemWidget extends StatefulWidget {
  final HomePageProductItemModel homeProductModel;
  final bool isSingleProductView;
  final bool showORnotShowWidgets;
  final bool showProductDetailsPageDeliverySection;
  final bool buyOrAddCartButtonShow;

  DEMOProductcardItemWidget(
    this.homeProductModel, {
    Key? key,
    this.isSingleProductView = false,
    this.showORnotShowWidgets = true,
    this.showProductDetailsPageDeliverySection = true,
    this.buyOrAddCartButtonShow = false,
  }) : super(key: key);

  @override
  State<DEMOProductcardItemWidget> createState() =>
      _DEMOProductcardItemWidgetState();
}

class _DEMOProductcardItemWidgetState extends State<DEMOProductcardItemWidget>
    with SingleTickerProviderStateMixin {
  // String? lastClickedButton;

  // void handleButtonClick(String buttonText) {
  //   setState(() {
  //     lastClickedButton = buttonText;
  //   });
  //   if (buttonText == 'Buy Now') {
  //     BuyandAddtoCartBottomButtonBar(onBuyNow: () {});
  //   } else if (buttonText == 'Add to Cart') {
  //     BuyandAddtoCartBottomButtonBar(onAddToCart: () {});
  //   }
  // }
  late TabController _tabController;
  final HomePageScrenController homePageScrenController =
      Get.put(HomePageScrenController());

  void _showPopupMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Add to cart successfully!'),
      ),
    );
  }

  void _forTestingBuyButton() {
    print("buyy");
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSingleProductView
        ? SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: _buildAllContentSeparateFromScaffold(context),
              ),
              bottomNavigationBar: BuyandAddtoCartBottomButtonBar(
                onBuyNow: () {
                  showCustomLargeBottomSheet(
                      context, true, false, "1", _forTestingBuyButton);
                },
                onAddToCart: () {
                  showCustomLargeBottomSheet(
                      context, false, true, "2", _showPopupMessage);
                },
              ),
            ),
          )
        : SingleChildScrollView(
            child: _buildAllContentSeparateFromScaffold(context),
          );
  }

  Widget _buildAllContentSeparateFromScaffold(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Content
        Container(
          height: widget.isSingleProductView ? null : 266.h,
          width: widget.isSingleProductView ? double.infinity : 150.h,
          color: widget.isSingleProductView ? Colors.white : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Container(
                padding: widget.isSingleProductView
                    ? EdgeInsets.only(
                        top: 0.0,
                      )
                    : EdgeInsets.zero,
                height: widget.isSingleProductView ? 400.h : 160.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(
                      () => CustomImageView(
                        imagePath: widget.homeProductModel.image.value,
                        height: double.infinity,
                        width: double.infinity,
                        radius: BorderRadius.circular(4.h),
                      ),
                    ),
                    if (widget.showORnotShowWidgets)
                      if (widget.homeProductModel.showNewTextOrDiscountPrice !=
                          null)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Obx(
                              () => Text(
                                widget.homeProductModel
                                    .showNewTextOrDiscountPrice!.value,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    if (widget.showORnotShowWidgets)
                      Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                            size: 15.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Product Details Section
              Padding(
                padding: widget.isSingleProductView
                    ? EdgeInsets.only(left: 20.h, top: 10.h)
                    : EdgeInsets.only(top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/money.png',
                          color: Colors.red,
                          height: widget.isSingleProductView ? 12.h : 14.h,
                          width: widget.isSingleProductView ? 25.h : 14.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "30",
                          style: TextStyle(
                            fontSize: widget.isSingleProductView ? 20.h : 14.h,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    if (widget.isSingleProductView == false)
                      Text("ART",
                          style: TextStyle(
                              fontSize: widget.isSingleProductView ? 15.h : 10,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    if (widget.isSingleProductView)
                      SizedBox(
                        height: 10.h,
                      ),
                    Text(
                        widget.isSingleProductView
                            ? "Premium Quality - stylish new T Shirt - calsual Exclusive Half sleeve T shirt Men - Tshirt"
                            : " T Shirt ",
                        style: TextStyle(
                            fontSize: widget.isSingleProductView ? 14.h : 16.h,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    if (widget.isSingleProductView)
                      SizedBox(
                        height: 10.h,
                      ),
                    Text(widget.homeProductModel.demoText!.value,
                        style: TextStyle(
                            fontSize: widget.isSingleProductView ? 15.h : 10.h,
                            color: widget.isSingleProductView
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              if (widget.isSingleProductView)
                SizedBox(
                  height: 20.h,
                ),

              if (widget.isSingleProductView)
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.h),
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      color: Colors.grey[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIconWithText(
                            icon: Icons.refresh,
                            text: "7 Days Return",
                          ),
                          SizedBox(height: 20.h),
                          _buildIconWithText(
                            icon: Icons.local_shipping,
                            text: "Free Shipping",
                            subText: "On Orders Over \$50",
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              //Get.back();

                              showCustomLargeBottomSheet(
                                  context, true, true, "", _showPopupMessage);
                            },
                            child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(horizontal: 0.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.category,
                                    size: 15.h,
                                  ),
                                  SizedBox(width: 8.w),
                                  Row(
                                    children: [
                                      _buildColorCircle(Colors.red),
                                      SizedBox(width: 4.w),
                                      _buildColorCircle(Colors.white,
                                          border:
                                              Border.all(color: Colors.black)),
                                      SizedBox(width: 4.w),
                                      _buildColorCircle(Colors.blue),
                                      SizedBox(width: 4.w),
                                      _buildColorCircle(Colors.black),
                                      SizedBox(width: 4.w),
                                      _buildColorCircle(Colors.yellow),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (widget.isSingleProductView)
                SizedBox(
                  height: 20.h,
                ),
              if (widget.isSingleProductView) _buildTabSection(),
              if (widget.isSingleProductView)
                SizedBox(
                  height: 20.h,
                ),
            ],
          ),
        ),
        // if (widget.isSingleProductView)
        //   BuyandAddtoCartBottomButtonBar(
        //     onBuyNow: () {
        //       showCustomLargeBottomSheet(
        //           context, true, false, "1", _forTestingBuyButton);
        //     },
        //     onAddToCart: () {
        //       showCustomLargeBottomSheet(
        //           context, false, true, "2", _showPopupMessage);
        //     },
        //   ),
      ],
    );
  }

  Widget _buildTabSection() {
    return Column(
      children: [
        // Tab Bar
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.red,
          tabs: [
            Tab(text: 'Description'),
            Tab(text: 'Seller'),
            Tab(text: 'Specifications'),
          ],
        ),
        // Tab Bar View
        Container(
          height: 200.h, // Set your desired height
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDescriptionTab(),
              _buildReviewsTab(),
              _buildSpecificationsTab(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildColorCircle(Color color, {Border? border}) {
  return Container(
    width: 16.h,
    height: 16.h,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: border,
    ),
  );
}

Widget _buildIconWithText({
  required IconData icon,
  required String text,
  String? subText,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 20.h,
      ),
      SizedBox(width: 12.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.bold),
          ),
          if (subText != null)
            Text(
              subText,
              style: TextStyle(fontSize: 12.h, color: Colors.grey),
            ),
        ],
      ),
    ],
  );
}

Widget _buildDescriptionTab() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      '\u2022 Budget Friendly Product\n'
      '\u2022 Brand: Tabassum Fashion LTD\n'
      '\u2022 Size: M, L, XL, XXL\n'
      '\u2022 * Size: M-Length 26, Chest 36\n'
      '\u2022 * Size: L-Length 27, Chest 38\n'
      '\u2022 * Size: XL-Length 28, Chest 40\n'
      '\u2022 * Size: XXL-Length 29, Chest 42\n'
      '\u2022 Fabrics: Jersey\n',
      style: TextStyle(fontSize: 14.h),
    ),
  );
}

Widget _buildReviewsTab() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Here are the reviews of the product.',
      style: TextStyle(fontSize: 14.h),
    ),
  );
}

Widget _buildSpecificationsTab() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Here are the specifications of the product.',
      style: TextStyle(fontSize: 14.h),
    ),
  );
}
