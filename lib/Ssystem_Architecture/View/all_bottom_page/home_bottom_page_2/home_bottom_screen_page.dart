import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/image_constant.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/demo_product_card_details.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_screen_product_card_item.dart';
import 'package:softminion/widgets/custom_image_view.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/custom_list_view_horizontal_home_page2.dart';

class HomeBottomScreenTWO extends StatelessWidget {
  HomeBottomScreenTWO({Key? key}) : super(key: key);

  final HomePageScrenController homePageScrenController =
      Get.put(HomePageScrenController());

  @override
  Widget build(BuildContext context) {
    print("home bottom screen");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                  child:
                      _buildSearchBar()), // Search bar widget aligned to the left
            ],
          ),
          backgroundColor: Colors.white, // AppBar background color
          automaticallyImplyLeading: false, // Remove default back button
        ),
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
                          // _buildFashionSaleText(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildSaletitleWithProductView(),
                    _buildSubtitleWithProductVieww1(),
                    _buildSubtitleWithProductVieww2(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFashionSaleText() {
    return SizedBox(
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
                top: 30.h,
                // bottom: 10.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 200.h),
                  Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text('Fashion Sale',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 30.w,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.h), // Padding for the search bar
      child: Container(
        height: 48.0, // Fixed height to make it square-shaped
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          border: Border.all(
            color: Colors.red, // Red border color
            width: 2.0, // Increase the width to make the border bold
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.red),
            border: InputBorder.none, // No default border
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            prefixIcon: Icon(Icons.search, color: Colors.red), // Search icon
          ),
        ),
      ),
    );
  }

  Widget _builtSaleTitle() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sale",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Super Summer sale",
                  style: TextStyle(
                      color: Color.fromARGB(255, 88, 87, 87), fontSize: 12),
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           Get.to(() => HomeBottomScreenTWO());
          //         },
          //         child: Text(
          //           "View All",
          //           style: TextStyle(
          //               color: const Color.fromARGB(255, 79, 78, 78),
          //               fontWeight: FontWeight.normal,
          //               fontSize: 15),
          //         ),
          //       ),
          //       SizedBox(height: 2.h),
          //       // Add any other text or widgets if needed
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _builtNewTitle() {
    return SizedBox(
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
                      color: Color.fromARGB(255, 88, 87, 87), fontSize: 12),
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           Get.to(() => HomeBottomScreenTWO());
          //         },
          //         child: Text(
          //           "View All",
          //           style: TextStyle(
          //               color: const Color.fromARGB(255, 79, 78, 78),
          //               fontWeight: FontWeight.normal,
          //               fontSize: 15),
          //         ),
          //       ),
          //       SizedBox(height: 2.h),
          //       // Add any other text or widgets if needed
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildSubtitleWithProductVieww1() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builtSaleTitle(),
          // CustomProductListView(
          //   itemBuilder: (context, model) {
          //     return ProductcardItemWidget(model);
          //   },
          // ),

          CustomProductListViewTestForFinal<HomePageProductItemModel>(
            height: 320,
            items: homePageScrenController
                .homePageScreenModel.value.productCardItemList,
            itemBuilder: (context, model) {
              return ProductcardItemWidget(
                model,
                // showORnotShowWidgets: true,
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

  Widget _buildSubtitleWithProductVieww2() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builtSaleTitle(),
          // CustomProductListView(
          //   itemBuilder: (context, model) {
          //     return ProductcardItemWidget(model);
          //   },
          // ),

          CustomProductListViewTestForFinal<HomePageProductItemModel>(
            height: 400,
            items: homePageScrenController
                .homePageScreenModel.value.productCardItemList,
            itemBuilder: (context, model) {
              return ProductcardItemWidget(
                model,
                // showORnotShowWidgets: true,
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

  Widget _buildSaletitleWithProductView() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builtSaleTitle(),

          ///old customProductListview for home Screen two when only show product in Home screen...
          // CustomProductListView(
          //   itemBuilder: (context, model) {
          //     return ProductcardItemWidget(model);
          //   },
          // ),

          ///this code now show productCardItemWidget in single class
          ///and after click show product details from Customized DemoProductitemWIdget class....

          CustomProductListViewTestForFinal<HomePageProductItemModel>(
            height: 320,
            items: homePageScrenController
                .homePageScreenModel.value.productCardItemList,
            itemBuilder: (context, model) {
              return ProductcardItemWidget(
                model,
                // showORnotShowWidgets: true,
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

  Widget _buildNewtitleWithProductVieww() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builtNewTitle(),
          // CustomProductListView(
          //   itemBuilder: (context, model) {
          //     return ProductcardItemWidget(model);
          //   },
          // ),

          CustomProductListViewTestForFinal<HomePageProductItemModel>(
            height: 320.h,
            items: homePageScrenController
                .homePageScreenModel.value.productCardItemList,
            itemBuilder: (context, model) {
              return ProductcardItemWidget(
                model,
                // showORnotShowWidgets: true,
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
      height: 150.h,
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
