import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';
import 'package:softminion/widgets/custom_bottom_sheet_content.dart';
import 'package:softminion/widgets/custom_icon.dart';
import 'package:softminion/widgets/custom_image_view.dart';

class AllTestClass extends StatelessWidget {
  // final HomePageProductItemModel homeProductModel;
  // final bool isSingleProductView;
  // final bool showFavoriteIcon;
  // final bool showProductDetailsPageDeliverySection;

  // AllTestClass(
  //   this.homeProductModel, {
  //   Key? key,
  //   this.isSingleProductView = false,
  //   this.showFavoriteIcon = true,
  //   this.showProductDetailsPageDeliverySection = true,
  // }) : super(key: key);
  AllTestClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Content
            Expanded(
              child: Container(
                height: 600.h,
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    Container(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      height: 400.h,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
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
                            ),
                          ),
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
                      padding: EdgeInsets.only(left: 20.h, top: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/money.png', // Path to your asset icon
                                color: Colors
                                    .red, // Set the color if the image supports colorization
                                height: 14.h, // Adjust height based on the view
                                width: 25.h, // Adjust width based on the view
                              ),
                              SizedBox(
                                  width: 5
                                      .w), // Add some spacing between the icon and the text
                              Text(
                                "30",
                                style: TextStyle(
                                  fontSize: 14.h,
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

                          Text("ART",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                              "Premium Quality - stylish new T Shirt - calsual Exclusive Half sleeve T shirt Men - Tshirt",
                              style: TextStyle(
                                  fontSize: 16.h,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text("hiiiiii",
                              style: TextStyle(
                                  fontSize: 10.h,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
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
                              SizedBox(
                                  height: 20.h), // Add spacing between items
                              _buildIconWithText(
                                icon: Icons.local_shipping,
                                text: "Free Shipping",
                                subText: "On Orders Over \$50",
                              ),
                              SizedBox(
                                  height: 20.h), // Add spacing between items
                              GestureDetector(
                                onTap: () {
                                  showCustomLargeBottomSheet(context);
                                },
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
                                        Container(
                                          width: 16
                                              .h, // Adjust the size of the circle
                                          height: 16.h,
                                          decoration: BoxDecoration(
                                            color: Colors.red, // Red color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(
                                            width: 4
                                                .w), // Space between the circles
                                        Container(
                                          width: 16.h,
                                          height: 16.h,
                                          decoration: BoxDecoration(
                                            color: Colors.white, // White color
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors
                                                    .black), // Add border for visibility
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Container(
                                          width: 16.h,
                                          height: 16.h,
                                          decoration: BoxDecoration(
                                            color: Colors.blue, // Blue color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Container(
                                          width: 16.h,
                                          height: 16.h,
                                          decoration: BoxDecoration(
                                            color: Colors.black, // Black color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Container(
                                          width: 16.h,
                                          height: 16.h,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.yellow, // Yellow color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () {
                // Handle Buy Now action
              },
              onAddToCart: () {
                // Handle Add to Cart action
              },
            ),
          ],
        ),
      ),
    );
  }
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
