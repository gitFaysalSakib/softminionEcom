import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/category_controller_new.dart';
import 'package:softminion/widgets/custom_image_view.dart';

class CategoriesBottomScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoriesBottomScreen> {
  // final CategoryController categoryController = Get.put(CategoryController());
  final CategoriesController categoriesController =
      Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
    //  print("category screen entry");
  }

  @override
  Widget build(BuildContext context) {
    //print("category screen widget");

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (categoriesController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[200],
                child: ListView.builder(
                  itemCount: categoriesController.categoryList.length,
                  itemBuilder: (context, index) {
                    var categoriesValue =
                        categoriesController.categoryList[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          categoriesController.selectedCategoryIndex =
                              index; // Update selected index
                        });
                        categoriesController.selectCategoriesMethod(
                            categoriesValue as CategoriesController);
                      },
                      child: Container(
                        color:
                            categoriesController.selectedCategoryIndex == index
                                ? Colors.white
                                : Color.fromARGB(255, 215, 211, 211),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Display image if available
                            if (categoriesValue.image.value?.src.value !=
                                    null &&
                                categoriesValue
                                    .image.value!.src.value.isNotEmpty)
                              Image.network(
                                categoriesValue.image.value?.src.value ?? '',
                                height: 40,
                                width: 40,
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
            // Expanded(
            //   flex: 4,
            //   child: Obx(() {
            //     var selectedCategory =
            //         categoryController.selectedCategory.value;
            //     if (selectedCategory == null) {
            //       return Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(Icons.category, size: 80, color: Colors.grey),
            //           SizedBox(height: 20),
            //           Text('Please select a category',
            //               style: TextStyle(fontSize: 18, color: Colors.grey)),
            //         ],
            //       );
            //     }
            //     return ListView.builder(
            //       itemCount: selectedCategory.subCategories.length,
            //       itemBuilder: (context, index) {
            //         var subCategory = selectedCategory.subCategories[index];
            //         var isExpanded = categoryController.expandedSubCategories
            //             .contains(subCategory);
            //         bool isSubSelected =
            //             categoryController.selectedSubCategory.value ==
            //                 subCategory;

            //         return ExpansionTile(
            //           leading: subCategory.image != null
            //               ? Image.asset(
            //                   subCategory.image!,
            //                   height: 40,
            //                   width: 40,
            //                 )
            //               : null,
            //           title: Text(subCategory.name),
            //           children: isExpanded
            //               ? [
            //                   GridView.builder(
            //                     shrinkWrap: true,
            //                     physics: NeverScrollableScrollPhysics(),
            //                     gridDelegate:
            //                         SliverGridDelegateWithFixedCrossAxisCount(
            //                       crossAxisCount: 3,
            //                       childAspectRatio: 0.75,
            //                     ),
            //                     itemCount: subCategory.subProducts.length,
            //                     itemBuilder: (context, subIndex) {
            //                       var subProduct =
            //                           subCategory.subProducts[subIndex];
            //                       return GestureDetector(
            //                         onTap: () {
            //                           categoryController.selectedSubCategory
            //                               .value = subCategory;
            //                           setState(() {});
            //                         },
            //                         child: GridTile(
            //                           child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             children: [
            //                               if (subProduct.image != null)
            //                                 SizedBox(
            //                                   height: 80,
            //                                   child: AspectRatio(
            //                                     aspectRatio: 1,
            //                                     child: CustomImageView(
            //                                       imagePath:
            //                                           "assets/images/iphone.png",
            //                                       height: 40,
            //                                       width: 40,
            //                                     ),
            //                                   ),
            //                                 ),
            //                               SizedBox(height: 4),
            //                               Text(
            //                                 subProduct.name,
            //                                 textAlign: TextAlign.center,
            //                                 style: TextStyle(fontSize: 12),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       );
            //                     },
            //                   ),
            //                 ]
            //               : [],
            //           onExpansionChanged: (expanded) {
            //             categoryController.toggleSubCategory(subCategory);

            //             categoryController.selectedSubCategory.value =
            //                 expanded ? subCategory : null;
            //             setState(() {});
            //           },
            //         );
            //       },
            //     );
            //   }),
            // ),
          ],
        );
      }),
    );
  }
}
