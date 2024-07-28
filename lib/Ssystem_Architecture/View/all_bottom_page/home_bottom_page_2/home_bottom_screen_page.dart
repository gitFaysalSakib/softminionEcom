import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/RND%20Page/home_product_item_show_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/home_screen_product_card_item.dart';
import 'package:softminion/widgets/custom_banner.dart';
import 'package:softminion/widgets/custom_image_view.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/custom_list_view_seperate_widget.dart';

class HomeBottomScreenTWO extends StatelessWidget {
  HomeBottomScreenTWO({Key? key}) : super(key: key);

  final HomePageScrenController homePageScrenController =
      Get.put(HomePageScrenController());

  @override
  Widget build(BuildContext context) {
    print("home bottom screen");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          _buildImageView(context),
                          SizedBox(
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.w,
                                        top: 80.h,
                                        bottom: 26.h,
                                      ),

                                      // SizedBox(height: 200.h),

                                      child: Text('Fashion Sale',
                                          style: TextStyle(
                                            fontSize: 30.w,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white,
                                          ))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildSubtitleWithProductVieww(),
                    _buildSubtitleWithProductVieww(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildSubtitleWithProductView() {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.only(
  //       left: 14.h,
  //       right: 6.h,
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           width: double.infinity,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               SizedBox(
  //                 width: double.infinity,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Expanded(
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             "New",
  //                             style: TextStyle(
  //                                 color: Colors.black,
  //                                 fontWeight: FontWeight.bold,
  //                                 fontSize: 40),
  //                           ),
  //                           SizedBox(height: 2.h),
  //                           Text(
  //                             "You've never seen it before!",
  //                             style: TextStyle(
  //                                 color: Color.fromARGB(255, 88, 87, 87),
  //                                 fontSize: 12),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               // SizedBox(height: 22.h),
  //               CustomProductListView(
  //                 itemBuilder: (context, model) {
  //                   return ProductcardItemWidget(model);
  //                 },
  //               ),

  //               // Obx(
  //               //   () => SizedBox(
  //               //     height: 266.h,
  //               //     width: double
  //               //         .infinity, // Adjust the height according to your need
  //               //     child: ListView.separated(
  //               //       scrollDirection: Axis.horizontal,
  //               //       separatorBuilder: (context, index) {
  //               //         return SizedBox(
  //               //           width: 16.h,
  //               //         );
  //               //       },
  //               //       itemCount: homePageScrenController
  //               //           .homePageScreenModel.value.productCardItemList.length,
  //               //       itemBuilder: (context, index) {
  //               //         HomePageProductItemModel model = homePageScrenController
  //               //             .homePageScreenModel
  //               //             .value
  //               //             .productCardItemList[index];
  //               //         return ProductcardItemWidget(model);
  //               //       },
  //               //     ),
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSubtitleWithProductVieww() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 14.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "You've never seen it before!",
                        style: TextStyle(
                            color: Color.fromARGB(255, 88, 87, 87),
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 79, 78, 78),
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      SizedBox(height: 2.h),
                      // Add any other text or widgets if needed
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomProductListView(
            itemBuilder: (context, model) {
              return ProductcardItemWidget(model);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImageView(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.homePageImageTest2,
      width: double.infinity,
      alignment: Alignment.topCenter,
      height: 150.h,
    );
  }

  Widget _buildBannerImage(BuildContext context) {
    return CustomImageBanner(
      imageUrl: 'https://example.com/your-image-url.jpg',
      title: 'Welcome to SoftMinion!',
      subtitle: 'The best place for your needs.',
      height: 150.0,
      overlayColor: Colors.black,
      overlayOpacity: 0.6,
    );
  }

  Widget _buildCheckButton(BuildContext context) {
    return CustomButton(
      textStyle: TextStyle(
          fontSize: 15.h, color: Colors.white, fontWeight: FontWeight.bold),
      height: 40.h,
      width: 160.w,
      isLoading: false,
      text: "Check",
      onPressed: () {
        Get.back();
      },
    );
  }
}
