import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_product_connect_home_page_model.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/widgets/custom_image_view.dart';

class ProductcardItemWidget extends StatelessWidget {
  final HomePageProductConnectHomePageModel homeProductModel;

  ProductcardItemWidget(this.homeProductModel, {Key? key}) : super(key: key);

  final homePageController = Get.find<HomePageScrenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 266.h,
      width: 150.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 184.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(
                    () => CustomImageView(
                      imagePath: homeProductModel.image!.value,
                      height: 184.h,
                      width: double.maxFinite,
                      radius: BorderRadius.circular(4.h),
                    ),
                  ),
                  Container(
                    height: 184.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Obx(
                          () => CustomImageView(
                            imagePath: homeProductModel.image1!.value,
                            height: 184.h,
                            width: double.maxFinite,
                            radius: BorderRadius.circular(4.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            height: 24.h,
            width: 40.h,
            text: "lbl_new2".tr,
            margin: EdgeInsets.only(left: 10.h, top: 8.h),
            // buttonStyle: CustomButtonStyles.fillGray,
            //buttonTextStyle: Theme.of(context).textTheme.labelMedium!,
            //alignment: Alignment.topLeft,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.homePage2,
                              height: 12.h,
                              width: 10.h,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.homePage3,
                              height: 12.h,
                              width: 14.h,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.homePage4,
                              height: 12.h,
                              width: 14.h,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.homepage1,
                              height: 12.h,
                              width: 14.h,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.homePage3,
                              height: 12.h,
                              width: 14.h,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Obx(
                                  () => Text(
                                    homeProductModel.ratingNumber!.value,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 24.h),
                    CustomImageView(
                      imagePath: ImageConstant.homePage2,
                      //   height: 36.adaptSize,
                      // width: 36.adaptSize,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              Obx(
                () => Text(
                  homeProductModel.brandName!.value,
                  // style: CustomTextStyles.bodySmall11_2,
                ),
              ),
              SizedBox(height: 6.h),
              Obx(
                () => Text(
                  homeProductModel.item!.value,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 6.h),
              Obx(
                () => Text(
                  homeProductModel.newPrice!.value,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
