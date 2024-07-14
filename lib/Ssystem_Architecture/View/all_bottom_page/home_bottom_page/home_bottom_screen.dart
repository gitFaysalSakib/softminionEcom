import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/widgets/custom_image_view.dart';
import 'package:softminion/widgets/custom_text_field.dart';

import '../../../../widgets/custom_button_field.dart';

class HomeBottomScreen extends StatelessWidget {
  HomeBottomScreen({Key? key}) : super(key: key);

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
                          CustomImageView(
                            imagePath: ImageConstant.homePageImage,
                            height: 500.h,
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                          ),
                          Container(
                            height: 492.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                _buildimageView(context),
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
                    SizedBox(height: 32.h),
                    //  _buildColumnSubtitle()
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
    isLoading: false,
    text: "Check",
    onPressed: () {
      Get.back();
    },
  );
}

Widget _buildColumnSubtitle() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subtitle',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'This is the subtitle text for the main page.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
