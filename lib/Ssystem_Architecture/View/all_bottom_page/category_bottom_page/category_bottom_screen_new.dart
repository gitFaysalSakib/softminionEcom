import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_screen_product_card_item.dart';
import 'package:softminion/widgets/Grid_builder/custom_grid_builder.dart';
import 'package:softminion/widgets/app_bar/custom_app_bar.dart';

class CategoriesBottomScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoriesBottomScreen> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final AllProductListController allProductListController =
      Get.put(AllProductListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set app bar height
        child: CustomAppBar(
          showCartIcon: true,
          showBackButton: false,
          showSearchBar: false,
        ), // Use the custom app bar here
      ),
      body: Obx(() {
        if (categoriesController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Row(
          children: [
            // Category side bar
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[100],
                child: ListView.builder(
                  itemCount: categoriesController.categoryList.length,
                  itemBuilder: (context, index) {
                    var categoriesValue =
                        categoriesController.categoryList[index];

                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          categoriesController.selectedCategoryIndex = index;

                          print(categoriesValue.id.value);
                        });
                        categoriesController.selectCategoriesMethod(
                            categoriesValue); // Pass categoriesValue directly
                        allProductListController
                            .setSelectedCategory(categoriesValue.id.value);
                        await allProductListController
                            .fetchDataFromApiServiceWithAttributesAndOthers();
                      },
                      child: Container(
                        color:
                            categoriesController.selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.grey[200],
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (categoriesValue.image.value?.src.value !=
                                    null &&
                                categoriesValue
                                    .image.value!.src.value.isNotEmpty)
                              Image.network(
                                categoriesValue.image.value?.src.value ?? '',
                                height: 30,
                                width: 30,
                                color: categoriesController
                                            .selectedCategoryIndex ==
                                        index
                                    ? Colors.red
                                    : Colors.black,
                              )
                            else
                              Container(), // Placeholder if image is not available
                            SizedBox(height: 4),
                            Text(
                              categoriesValue.name.value,
                              style: TextStyle(
                                fontSize: 12,
                                color: categoriesController
                                            .selectedCategoryIndex ==
                                        index
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Content area (currently empty but can be filled later)
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: Obx(() {
                  // Check if products are loaded and display the grid view
                  if (allProductListController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (allProductListController.dataList.isNotEmpty) {
                    return CustomProductGridView<AllProductsListModel>(
                      items: allProductListController.dataList,
                      crossAxisCount: 2, // Show 3 products per row
                      aspectRatio: 0.80,
                      itemBuilder: (context, product, isGrid) =>
                          ProductcardItemWidget(
                        product,
                        isGrid: isGrid,
                      ),
                      isGrid: true,
                      onItemTap: (homeProductModel) {
                        final id = homeProductModel.id.value;
                        Get.toNamed('/product_details', arguments: {
                          'productId': id,
                          'isSingleProductView': true,
                          'showORnotShowWidgets': false,
                        });
                      },
                      scrollController: ScrollController(),
                    );
                  } else {
                    return Center(child: Text('No products available'));
                  }
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
