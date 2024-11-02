import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_attributes_controller.dart';

class FilterDrawer extends StatelessWidget {
  final CategoriesController categoriesController;
  final ProductAttributesController productAttributesController;
  final AllProductListController allProductadataController = Get.find();

  FilterDrawer({
    required this.categoriesController,
    required this.productAttributesController,
  });

  @override
  Widget build(BuildContext context) {
    productAttributesController.fetchSingleAttributesValue();

    return SafeArea(
      child: Drawer(
        child: Container(
          width: 300, // Set width as per your requirement
          color: Colors.white, // Background color
          child: Column(
            children: [
              // Drawer Header
              Container(
                width: double.infinity, // Match the drawer width

                padding: EdgeInsets.all(16.0), // Padding for header
                color: Colors.red,
                child: Text(
                  'Filter Options',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              // Drawer content
              Expanded(
                child: SingleChildScrollView(
                  // Ensures the entire drawer content can scroll
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to left

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[300]),
                        ),
                      ),
                      Obx(() {
                        if (categoriesController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: categoriesController.categoryList.length,
                            itemBuilder: (context, index) {
                              final category =
                                  categoriesController.categoryList[index];

                              bool isSelected = categoriesController
                                  .isSelectedPassId(category.id.value);

                              return ListTile(
                                leading: Image.network(
                                  category.image.value?.src.value ?? '',
                                  width: 20.w,
                                  height: 20.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.image, size: 30.w);
                                  },
                                ),
                                title: Obx(() {
                                  return Text(category.name?.value ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: categoriesController
                                                .isSelectedPassId(
                                                    category.id.value)
                                            ? Colors.red
                                            : Colors.cyan[
                                                900], // Change color based on selection
                                      ));
                                }),
                                // Change the color based on selection
                                // Background color for selected category
                                onTap: () {
                                  print(category.id.value);
                                  categoriesController.selectCategory(category
                                      .id
                                      .value); // Update selected category ID on tap
                                },
                              );
                            },
                            physics: BouncingScrollPhysics(),
                          ),
                        );
                      }),
                      // Divider between categories and attributes
                      Divider(thickness: 2, color: Colors.grey[300]),
                      // Spacer between sections
                      SizedBox(height: 10),
                      // Product Attributes List (Independently scrollable)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Attributes',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[300]),
                        ),
                      ),
                      Obx(() {
                        if (productAttributesController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container(
                          height: 300, // Adjust height as needed
                          child: ListView.builder(
                            itemCount: productAttributesController
                                .attributesList.length,
                            itemBuilder: (context, index) {
                              final attribute = productAttributesController
                                  .attributesList[index];
                              final attributeValues =
                                  productAttributesController
                                              .attributeValuesListFetch[
                                          attribute.id.toString()] ??
                                      [];
                              return ExpansionTile(
                                title: Text(
                                  attribute.name ?? '',
                                  style: TextStyle(
                                      color: Colors.cyan[900],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: attributeValues.map((value) {
                                  return Obx(() {
                                    return CheckboxListTile(
                                      title: Text(value.name ?? ''),
                                      value: productAttributesController
                                          .selectedCheckBoxAttributeValues
                                          .contains(value
                                              .name), // Check if value is selected

                                      onChanged: (isChecked) {
                                        if (isChecked == true) {
                                          // If checked, add the value to selected values
                                          productAttributesController
                                              .selectedCheckBoxAttributeValues
                                              .add(value.name!);
                                        } else {
                                          // If unchecked, remove the value from selected values
                                          productAttributesController
                                              .selectedCheckBoxAttributeValues
                                              .remove(value.name!);
                                        }
                                        // Update the state to reflect changes
                                        productAttributesController
                                            .update(); // Assuming you're using GetX for state management
                                      },
                                    );
                                  });
                                }).toList(),
                              );
                            },
                            physics:
                                BouncingScrollPhysics(), // Independent scroll
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              // Apply Filters Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  // Makes the container take full width

                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedCategoryId =
                          categoriesController.selectedCategoryId?.value;
                      final selectedAttributes = productAttributesController
                          .selectedCheckBoxAttributeValues
                          .toList();
                      // Pass the selected category and attributes to the controller
                      allProductadataController.setSelectedCategory(
                          selectedCategoryId ??
                              0); // Default to 0 if none selected
                      allProductadataController
                          .setSelectedAttributes(selectedAttributes);

                      // Fetch products with the selected filters
                      await allProductadataController
                          .fetchDataFromApiServiceWithAttributesAndOthers();
                      Navigator.of(context).pop();
                    },
                    child: Text('Apply Filters'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red, // Set the text color
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0), // Optional: Add padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: Rounded corners
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
