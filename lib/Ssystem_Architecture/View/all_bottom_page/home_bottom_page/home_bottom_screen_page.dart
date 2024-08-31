import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/demo_product_card_details.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_bottom_screen_page.dart';
import 'package:softminion/all_test_class.dart';
import 'package:softminion/widgets/custom_image_view.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/main_custom_list_view_builder.dart';

class HomeBottomScreen extends StatelessWidget {
  HomeBottomScreen({
    Key? key,
  }) : super(key: key);

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
                          _buildimageView(context),
                          SizedBox(
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                      left: 10.h,
                                      top: 100.h,
                                      // bottom: 10.h,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 200.h),
                                        Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text('Fashion Sale',
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 50.w,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white,
                                                ))),
                                        SizedBox(height: 18.h),
                                        _buildCheckButton(context)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
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
                      SizedBox(height: 4.h),
                      Text(
                        "You've never seen it before!",
                        style: TextStyle(
                            color: Color.fromARGB(255, 88, 87, 87),
                            fontSize: 12),
                      ),
                      SizedBox(height: 6.h),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => HomeBottomScreenTWO());
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 79, 78, 78),
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      // Add any other text or widgets if needed
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomProductListViewNew<HomePageProductItemModel>(
            items: homePageScrenController
                .homePageScreenModel.value.productCardItemList,
            itemBuilder: (context, model) {
              return DEMOProductcardItemWidget(
                model,
                showORnotShowWidgets: true,
              );
            },
            onItemTap: (homeProductModel) {
              Get.to(() => DEMOProductcardItemWidget(
                    homeProductModel,
                    isSingleProductView: true,
                    showORnotShowWidgets: false,
                  ));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildimageView(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.homePageImage,
      width: double.infinity,
      alignment: Alignment.topCenter,
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
