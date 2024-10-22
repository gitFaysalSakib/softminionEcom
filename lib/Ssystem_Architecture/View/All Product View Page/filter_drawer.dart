// filter_drawer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/product_attributes_api.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';

class FilterDrawer extends StatelessWidget {
  final CategoriesController categoriesController;

  FilterDrawer({required this.categoriesController});
  final ApiProductAttributes apiService = ApiProductAttributes();

  @override
  Widget build(BuildContext context) {
    apiService.fetchData();

    return Container(
      width: 300, // Set width as per your requirement
      color: Colors.white, // Background color
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0), // Padding for header
            color: Colors.blue,
            child: Text(
              'Filter Options',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (categoriesController.isLoading.value) {
                return Center(
                    child: CircularProgressIndicator()); // Show loading spinner
              }
              return ListView.builder(
                itemCount: categoriesController.categoryList.length,
                itemBuilder: (context, index) {
                  final category = categoriesController.categoryList[index];
                  return ListTile(
                    leading: Image.network(
                      category.image.value!.src.value ?? '',
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                      color: Colors.red,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image, size: 30.w);
                      },
                    ),
                    title: Text(category.name?.value ?? ''),
                    onTap: () {
                      // Handle category filtering
                      Navigator.pop(context); // Close the drawer
                      categoriesController.selectCategoriesMethod(
                          category as CategoriesController);
                    },
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Apply filters and close the drawer
                Navigator.of(context).pop();
              },
              child: Text('Apply Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
