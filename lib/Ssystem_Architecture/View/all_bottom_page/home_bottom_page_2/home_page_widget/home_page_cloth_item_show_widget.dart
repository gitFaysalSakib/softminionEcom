import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_screen_product_card_item.dart';
import 'package:softminion/widgets/List_builder_horizontal/custom_list_view_horizontal_home_page2.dart';

// Create the SaleTitleWithProductView class
class ClothCategoriesProductItemShow extends StatelessWidget {
  final AllProductListController allProductadataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            // Show a loading indicator while the data is being fetched
            if (allProductadataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (allProductadataController
                .filterClothProduct.isNotEmpty) {
              // Show the category name (e.g., "Featured Products") after loading is done
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add category name widget here
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      allProductadataController
                          .filterClothProduct
                          .first
                          .type
                          .first
                          .categoryType
                          .value, // Replace with your category name if dynamic
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Display the list of products fetched from the API
                  CustomProductListViewTestForFinal<AllProductsListModel>(
                    height: 200,
                    items: allProductadataController.filterClothProduct,
                    itemBuilder: (context, model) {
                      // print(
                      //     allProductadataController.isEvenForRowDisplay.value);
                      return ProductcardItemWidget(
                          model); // Your custom product item widget
                    },
                    onItemTap: (homeProductModel) {
                      final id = homeProductModel
                          .id.value; // Assuming this is an Rx type
                      Get.toNamed('/product_details', arguments: {
                        'productId': id,
                        'isSingleProductView': true,
                        'showORnotShowWidgets': false,
                      });
                    },
                    isEven:
                        allProductadataController.isEvenForOneRowDisplay.value,
                  ),
                ],
              );
            } else {
              // If no products are found, show a message
              return Center(
                  child: Text('No products found in the "Featured" category.'));
            }
          }),
        ],
      ),
    );
  }
}
