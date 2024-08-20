//new..
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/widgets/custom_image_view.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';

class ProductcardItemWidget extends StatelessWidget {
  ProductcardItemWidget(
    this.homeProductModel, {
    Key? key,
  }) : super(key: key);
  final HomePageProductItemModel homeProductModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: 150.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 160.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(
                    () => CustomImageView(
                      imagePath: homeProductModel.image.value,
                      height: 184.h,
                      width: double.maxFinite,
                      radius: BorderRadius.circular(4.h),
                    ),
                  ),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Obx(
                        () => Text(
                          homeProductModel.showNewTextOrDiscountPrice!.value,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 150.h,
              padding: EdgeInsets.all(8.h),
              // color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(homeProductModel.brandName!.value,
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal))),

                  Obx(() => Text(homeProductModel.item!.value,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))),
                  Obx(() => Text(homeProductModel.newPrice!.value,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red))),
                  // Obx(() => Text(homeProductModel.ratingNumber!.value,
                  //     style: TextStyle(fontSize: 12.w, color: Colors.grey))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
