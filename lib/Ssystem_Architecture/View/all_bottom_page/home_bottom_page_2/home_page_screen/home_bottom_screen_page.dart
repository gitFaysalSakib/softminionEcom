import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_sign_up_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/payment_method_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_page_category_widget.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_page_cloth_item_show_widget.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_page_featured_item_show_widget.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_page_games_item_show_widget.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_screen_product_card_item.dart';
import 'package:softminion/Token_Manage/token_store.dart';
import 'package:softminion/widgets/app_bar/custom_app_bar.dart';
import 'package:softminion/widgets/custom_carousol_banner/carousol_banner.dart';
import 'package:softminion/widgets/List_builder_horizontal/custom_list_view_horizontal_home_page2.dart';

class HomeBottomScreenTWO extends StatelessWidget {
  HomeBottomScreenTWO({Key? key}) : super(key: key);

  // final HomePageScrenController homePageScrenController =
  //     Get.put(HomePageScrenController());

  final AllProductListController allProductadataController =
      Get.put(AllProductListController());
  AllProductsListModel? _homeProductModel;

  final PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());
  final CategoriesController categoriesController =
      Get.put(CategoriesController());

  final SignupController signupController = Get.put(SignupController());
  final TokenService tokenService = Get.find<TokenService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set app bar height
        child: CustomAppBar(), // Use the custom app bar here
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
                        // CustomAppBar()
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Add your category buttons here
                  HomePageCategoryWidget(),
                  SizedBox(height: 20.h),

                  FeaturedCategoriesProductItemShow(),
                  SizedBox(height: 20.h),

                  ClothCategoriesProductItemShow(),
                  SizedBox(height: 20.h),
                  GamesCategoriesProductItemShow(),
                  SizedBox(height: 20.h),

                  GestureDetector(
                    onTap: () {
                      // Get.to(AllProductScreen());
                      // Add your navigation logic here
                      // final NavigationController navigationController =
                      //     Get.put(NavigationController());
                      // navigationController.selectedIndex.value = 5;
                      Get.toNamed('/product_display');
                      allProductadataController
                          .fetchDataFromApiServicePageSetDynamically();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the "View More" text
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 18, // Slightly larger font for emphasis
                            color: Colors
                                .red.shade700, // Darker shade for more subtlety
                            fontWeight: FontWeight.bold, // Make it stand out
                            letterSpacing:
                                0.5, // Add a little spacing between letters for readability
                          ),
                        ),
                        SizedBox(
                            width: 5), // Space between the text and the icon
                        Icon(
                          Icons.arrow_forward_ios, // Use a forward arrow icon
                          size: 16, // Smaller icon size to complement the text
                          color: Colors.red, // Match the color of the text
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // _buildSubtitleWithProductVieww1(),
                  // _buildSubtitleWithProductVieww2(),
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
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Distribute space between the children
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Aligns children vertically at the center
              children: const [
                Text(
                  "Popular",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "View more",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
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
          // _builtSaleTitle(),
          Obx(() {
            if (allProductadataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            // Display a list of products from the API
            return CustomProductListViewTestForFinal<AllProductsListModel>(
              // height: 250,
              items: allProductadataController
                  .dataList, // This contains all products fetched from the API
              itemBuilder: (context, model) {
                // Display each product item using ProductcardItemWidget
                return ProductcardItemWidget(model);
              },

              onItemTap: (homeProductModel) {
                final id = homeProductModel.id.value;
                Get.toNamed('/product_details', arguments: {
                  'productId': id,
                  'isSingleProductView': true, // Pass the value
                  'showORnotShowWidgets': false, // Pass the value
                }); // Assuming it's an Rx type

                // Get.to(() => DEMOProductcardItemWidget(
                //       productId: id, // Pass productId
                //       isSingleProductView: true,
                //       showORnotShowWidgets: false,
                //     ));
              },
              isEven: false,
            );
          })
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
          Obx(() {
            if (allProductadataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            // Display a list of products from the API
            return CustomProductListViewTestForFinal<AllProductsListModel>(
              //height: 250,
              items: allProductadataController
                  .dataList, // This contains all products fetched from the API
              itemBuilder: (context, model) {
                // Display each product item using ProductcardItemWidget
                return ProductcardItemWidget(model);
              },

              onItemTap: (homeProductModel) {
                final id = homeProductModel.id.value;
                Get.toNamed('/product_details', arguments: {
                  'productId': id,
                  'isSingleProductView': true, // Pass the value
                  'showORnotShowWidgets': false, // Pass the value
                }); // Assuming it's an Rx type

                // Get.to(() => DEMOProductcardItemWidget(
                //       productId: id, // Pass productId
                //       isSingleProductView: true,
                //       showORnotShowWidgets: false,
                //     ));
              },
              isEven: allProductadataController.isEvenForOneRowDisplay.value,
            );
          })
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
          Obx(() {
            if (allProductadataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            // Display a list of products from the API
            return CustomProductListViewTestForFinal<AllProductsListModel>(
              // height: 260,
              items: allProductadataController
                  .dataList, // This contains all products fetched from the API
              itemBuilder: (context, model) {
                // Display each product item using ProductcardItemWidget
                return ProductcardItemWidget(model);
              },

              onItemTap: (homeProductModel) {
                final id = homeProductModel.id.value;
                Get.toNamed('/product_details', arguments: {
                  'productId': id,
                  'isSingleProductView': true, // Pass the value
                  'showORnotShowWidgets': false, // Pass the value
                }); // Assuming it's an Rx type

                // Get.to(() => DEMOProductcardItemWidget(
                //       productId: id, // Pass productId
                //       isSingleProductView: true,
                //       showORnotShowWidgets: false,
                //     ));
              },
              isEven: allProductadataController.isEvenForOneRowDisplay.value,
            );
          })
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
          // _builtNewTitle(),
          Obx(() {
            if (allProductadataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            // Display a list of products from the API
            return CustomProductListViewTestForFinal<AllProductsListModel>(
              // height:
              //     320.h,
              items: allProductadataController
                  .dataList, // Pass the fetched product list

              // Display each product item using ProductcardItemWidget
              itemBuilder: (context, model) {
                return ProductcardItemWidget(
                    model); // Pass the model to your widget
              },

              // Handle product taps
              onItemTap: (homeProductModel) {
                final id = homeProductModel.id.value; // Access the product's ID
                Get.toNamed(
                  '/product_details',
                  arguments: {
                    'productId': id, // Pass the ID of the selected product
                    'isSingleProductView':
                        true, // Pass single product view flag
                    'showORnotShowWidgets':
                        false, // Pass widget visibility flag
                  },
                );
              },

              // Use your boolean to control row display
              isEven: allProductadataController.isEvenForOneRowDisplay.value,
            );
          })
        ],
      ),
    );
  }

  Widget _buildimageView(BuildContext context) {
    return CustomCarouselSlider(
      images: [
        'assets/images/banner1.png',
        'assets/images/banner2.png',
        'assets/images/banner3.png',
        'assets/images/banner4.png',
        'assets/images/banner6.png',
      ],
      height: 150.0,
      autoPlay: true,
    );
  }
}
