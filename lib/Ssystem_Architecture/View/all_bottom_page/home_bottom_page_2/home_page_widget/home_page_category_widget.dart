import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';

class HomePageCategoryWidget extends StatelessWidget {
  final CategoriesController categoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return _buildCategoryButtons(); // Calling the widget here
  }

  Widget _buildCategoryButtons() {
    return Obx(() {
      if (categoriesController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return SizedBox(
        height: 50.h, // Set the height for the category buttons row
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesController.categoryList.length,
          itemBuilder: (context, index) {
            var category = categoriesController.categoryList[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120.w, // Longer width for horizontal rectangle
                  height: 50.h, // Shorter height for rectangular look
                  decoration: BoxDecoration(
                    color: Colors.white, // Customize background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Display the category image from API
                      Padding(
                        padding: EdgeInsets.only(left: 8.w, right: 6.w),
                        child: category.image != null &&
                                category.image.value != null
                            ? Image.network(
                                category.image.value!.src.value ?? '',
                                width: 30.w,
                                height: 30.h,
                                fit: BoxFit.cover,
                                color: Colors.red,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.image, size: 30.w);
                                },
                              )
                            : Icon(Icons.image, size: 30.w),
                      ),
                      // Text that adapts to available space
                      Expanded(
                        child: Text(
                          category.name.value,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                          ),
                          maxLines: 1, // Limit to one line
                          overflow: TextOverflow.ellipsis, // Add ellipsis
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
