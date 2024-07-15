import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_screen_model.dart';
import 'package:softminion/widgets/custom_image_view.dart';
import 'package:softminion/widgets/custom_text_field.dart';

import '../../../../widgets/custom_button_field.dart';
import 'home_product_item_show_screen.dart';

class HomeBottomScreen extends StatelessWidget {
  HomeBottomScreen({Key? key}) : super(key: key);

  // HomePageScrenController homePageScrenController =
  //     Get.put(HomePageScrenController(HomePageScreenModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 492.h,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          _buildimageView(context),
                          // CustomImageView(
                          //   imagePath: ImageConstant.homePageImage,
                          //   height: 500.h,
                          //   width: double.infinity,
                          //   alignment: Alignment.topCenter,
                          // ),
                          Container(
                            height: 492.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                //  _buildimageView(context),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                      left: 10.h,
                                      top: 32.h,
                                      bottom: 32.h,
                                    ),
                                    // decoration:
                                    //    AppDecoration.gradientBlackToBlack,
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
                                                ))
                                            // Text(
                                            //   "lbl_fashion_sale",
                                            //   maxLines: null,
                                            //   overflow: TextOverflow.ellipsis,
                                            //   style: CustomTextStyles
                                            //       .displayMediumOnPrimary,
                                            // ),

                                            ),
                                        SizedBox(height: 18.h),
                                        _buildCheckButton(context)
                                        // CustomElevatedButton(
                                        //   height: 36.h,
                                        //   width: 160.w,
                                        //   text: "llb_check".tr,
                                        //   buttonStyle:
                                        //       CustomButtonStyle.outLineRedFTL18,
                                        // ),
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
                    _buildColumnSubtitle()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildColumnSubtitle() {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  HomePageScrenController homePageScrenController =
      Get.put(HomePageScrenController(HomePageScreenModel().obs));

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
          width: 354.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          Text(
                            "New",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                          Text(
                            "New",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "You've never seen it befor!",
                            style: TextStyle(
                                color: Color.fromARGB(255, 88, 87, 87),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   "lbl_view_all".tr,
                    //   style: CustomTextStyles.bodySmallGray90011,
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              SizedBox(
                height: 500.h,
                width: double.infinity,
                child: Obx(
                  () =>
                      //  ListView.separated(
                      //   scrollDirection: Axis.horizontal,
                      //   separatorBuilder: (context, index) {
                      //     return SizedBox(width: 16);
                      //   },
                      //   itemCount: items.length,
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       width: 100,
                      //       color: Colors.blueAccent,
                      //       child: Center(
                      //         child: Text(
                      //           items[index],
                      //           style: TextStyle(color: Colors.white, fontSize: 18),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),

                      /////
                      ///

                      ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 16.h,
                      );
                    },
                    itemCount: homePageScrenController
                        .homepageModel.value.productcardItemList.value.length,
                    itemBuilder: (context, index) {
                      HomePageProductitemmodel model = homePageScrenController
                          .homepageModel.value.productcardItemList.value[index];
                      return ProductcardItemWidget(model);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildimageView(BuildContext context) {
  return CustomImageView(
    imagePath: ImageConstant.homePageImage,
    height: 500.h,
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

// Widget _buildColumnSubtitle() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 16.h),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Subtitle',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           'This is the subtitle text for the main page.',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//   );
// }

