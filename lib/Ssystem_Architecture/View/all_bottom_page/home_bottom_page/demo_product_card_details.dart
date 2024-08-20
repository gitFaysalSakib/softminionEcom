import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';
import 'package:softminion/widgets/custom_bottom_sheet_content.dart';
import 'package:softminion/widgets/custom_icon.dart';
import 'package:softminion/widgets/custom_image_view.dart';

class DEMOProductcardItemWidget extends StatelessWidget {
  final HomePageProductItemModel homeProductModel;
  final bool isSingleProductView;
  final bool showORnotShowWidgets;
  final bool showProductDetailsPageDeliverySection;

  DEMOProductcardItemWidget(
    this.homeProductModel, {
    Key? key,
    this.isSingleProductView = false,
    this.showORnotShowWidgets = true,
    this.showProductDetailsPageDeliverySection = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSingleProductView
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
              body: _buildAllContentSeparateFromScaffold(context),
            ),
          )
        : _buildAllContentSeparateFromScaffold(context);
  }

  Widget _buildAllContentSeparateFromScaffold(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Content
        Expanded(
          child: Container(
            height: isSingleProductView ? null : 266.h,
            width: isSingleProductView ? double.infinity : 150.h,
            color: isSingleProductView ? Colors.white : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Container(
                  padding: isSingleProductView
                      ? EdgeInsets.only(
                          top: 0.0,
                        )
                      : EdgeInsets.zero,
                  height: isSingleProductView ? 400.h : 160.h,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(
                        () => CustomImageView(
                          imagePath: homeProductModel.image.value,
                          height: double.infinity,
                          width: double.infinity,
                          radius: BorderRadius.circular(4.h),
                        ),
                      ),
                      if (showORnotShowWidgets)
                        if (homeProductModel.showNewTextOrDiscountPrice != null)
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
                                  homeProductModel
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
                      if (showORnotShowWidgets)
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
                  padding: isSingleProductView
                      ? EdgeInsets.only(left: 20.h, top: 10.h)
                      : EdgeInsets.only(top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/money.png', // Path to your asset icon
                            color: Colors
                                .red, // Set the color if the image supports colorization
                            height: isSingleProductView
                                ? 12.h
                                : 14.h, // Adjust height based on the view
                            width: isSingleProductView
                                ? 25.h
                                : 14.h, // Adjust width based on the view
                          ),
                          SizedBox(
                              width: 5
                                  .w), // Add some spacing between the icon and the text
                          Text(
                            "30",
                            style: TextStyle(
                              fontSize: isSingleProductView ? 20.h : 14.h,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      //this OBX value design for when data comes to API.. NOW this code stop and use statice vale ...
                      // Obx(() => Text(homeProductModel.newPrice!.value,
                      //     style: TextStyle(
                      //         fontSize: isSingleProductView ? 25.h : 14.h,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.red))),
                      // Obx(() => Text(homeProductModel.brandName!.value,
                      //     style: TextStyle(
                      //         fontSize: isSingleProductView ? 15.h : 10,
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.normal))),
                      // Obx(() => Text(homeProductModel.item!.value,
                      //     style: TextStyle(
                      //         fontSize: isSingleProductView ? 20.h : 16.h,
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.bold))),
                      // if (isSingleProductView)
                      //   SizedBox(
                      //     height: 10.h,
                      //   ),
                      // Obx(() => Text(homeProductModel.demoText!.value,
                      //     style: TextStyle(
                      //         fontSize: isSingleProductView ? 15.h : 10.h,
                      //         color: isSingleProductView
                      //             ? Colors.grey
                      //             : Colors.black,
                      //         fontWeight: FontWeight.bold))),

                      //thic code use now statice vale.....

                      if (isSingleProductView == false)
                        Text("ART",
                            style: TextStyle(
                                fontSize: isSingleProductView ? 15.h : 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      if (isSingleProductView)
                        SizedBox(
                          height: 10.h,
                        ),
                      Text(
                          isSingleProductView
                              ? "Premium Quality - stylish new T Shirt - calsual Exclusive Half sleeve T shirt Men - Tshirt"
                              : " T Shirt ",
                          style: TextStyle(
                              fontSize: isSingleProductView ? 14.h : 16.h,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      if (isSingleProductView)
                        SizedBox(
                          height: 10.h,
                        ),
                      Text(homeProductModel.demoText!.value,
                          style: TextStyle(
                              fontSize: isSingleProductView ? 15.h : 10.h,
                              color: isSingleProductView
                                  ? Colors.grey
                                  : Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                if (isSingleProductView)
                  SizedBox(
                    height: 20.h,
                  ),
                if (isSingleProductView)
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10.h), // Adjust the curvature here
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        color: Colors.grey[
                            100], // Set your desired background color here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildIconWithText(
                              icon: Icons.refresh,
                              text: "7 Days Return",
                            ),
                            SizedBox(height: 20.h), // Add spacing between items
                            _buildIconWithText(
                              icon: Icons.local_shipping,
                              text: "Free Shipping",
                              subText: "On Orders Over \$50",
                            ),
                            SizedBox(height: 20.h), // Add spacing between items
                            GestureDetector(
                              onTap: () {
                                showCustomLargeBottomSheet(context);
                              },
                              child: Container(
                                color: Colors
                                    .transparent, // Ensure the entire area is clickable
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        0.0), // Adjust the padding as needed
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.category,
                                      size: 15.h, // Adjust the size as needed
                                    ),
                                    SizedBox(
                                        width: 8
                                            .w), // Space between the icon and the first circle
                                    Row(
                                      children: [
                                        _buildColorCircle(Colors.red),
                                        SizedBox(
                                            width: 4
                                                .w), // Space between the circles
                                        _buildColorCircle(Colors.white,
                                            border: Border.all(
                                                color: Colors.black)),
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
                            )

// Helper method to build a color circle
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        // Bottom Button Bar
        if (isSingleProductView)
          BuyandAddtoCartBottomButtonBar(
            onBuyNow: () {
              // Handle Buy Now action
            },
            onAddToCart: () {
              // Handle Add to Cart action
            },
          ),
      ],
    );
  }
}

Widget _buildColorCircle(Color color, {Border? border}) {
  return Container(
    width: 16.h, // Adjust the size of the circle
    height: 16.h,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: border, // Optional border
    ),
  );
}

Widget _buildIconWithText({
  required IconData icon,
  String? text,
  String? subText,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 15.h,
        color: Colors.grey[700],
      ),
      SizedBox(width: 12.h), // Space between icon and text
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text != null)
            Text(
              text,
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          if (subText != null)
            Text(
              subText,
              style: TextStyle(
                fontSize: 10.h,
                color: Colors.grey[600],
              ),
            ),
        ],
      ),
    ],
  );
}
