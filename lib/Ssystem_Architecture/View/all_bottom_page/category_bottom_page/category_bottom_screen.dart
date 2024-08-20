// // lib/views/category_screen.dart
// // import 'package:category/controller.dart';
// // import 'package:category/icon.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class CategoryScreen extends StatefulWidget {
// //   @override
// //   _CategoryScreenState createState() => _CategoryScreenState();
// // }

// // class _CategoryScreenState extends State<CategoryScreen> {
// //   final CategoryController categoryController = Get.put(CategoryController());

// //   @override
// //   void initState() {
// //     super.initState();
// //     categoryController.selectedCategory.bindStream(categoryController
// //         .categories.stream
// //         .map((categories) => categories.isNotEmpty ? categories.first : null));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: Obx(() {
// //           var selectedSubCategory =
// //               categoryController.selectedSubCategory.value;
// //           if (selectedSubCategory != null) {
// //             return Text(selectedSubCategory.name);
// //           }
// //           var selectedCategory = categoryController.selectedCategory.value;
// //           return Text(selectedCategory?.name ?? 'Categories');
// //         }),
// //       ),
// //       body: Obx(() {
// //         if (categoryController.isLoading.value) {
// //           return Center(child: CircularProgressIndicator());
// //         }
// //         return Row(
// //           children: [
// //             Expanded(
// //               flex: 1,
// //               child: Container(
// //                 color: Colors.grey[200],
// //                 child: ListView.builder(
// //                   itemCount: categoryController.categories.length,
// //                   itemBuilder: (context, index) {
// //                     var category = categoryController.categories[index];
// //                     //  print(category.name);
// //                     bool isSelected =
// //                         categoryController.selectedCategory.value == category;

// //                     return GestureDetector(
// //                       onTap: () {
// //                         categoryController.selectCategory(category);
// //                         categoryController.selectedSubCategory.value = null;
// //                         setState(() {});
// //                       },
// //                       child: Container(
// //                         color: isSelected
// //                             ? Colors.white
// //                             : Color.fromARGB(255, 215, 211, 211),
// //                         padding: EdgeInsets.symmetric(
// //                             vertical: 8.0, horizontal: 4.0),
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             CustomImageView(
// //                               imagePath: "assets/responsive.png",
// //                               color: isSelected ? Colors.red : Colors.black,
// //                               height: 40,
// //                               width: 40,
// //                             ),
// //                             // Image.network(
// //                             //   category.image,
// //                             //   height: 40,
// //                             //   width: 40,
// //                             // ),
// //                             SizedBox(height: 4),
// //                             Text(
// //                               category.name,
// //                               style: TextStyle(
// //                                 fontSize: 12,
// //                                 color: isSelected ? Colors.red : Colors.black,
// //                               ),
// //                               textAlign: TextAlign.center,
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //             Expanded(
// //               flex: 4,
// //               child: Obx(() {
// //                 var selectedCategory =
// //                     categoryController.selectedCategory.value;
// //                 if (selectedCategory == null) {
// //                   return Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(Icons.category, size: 80, color: Colors.grey),
// //                       SizedBox(height: 20),
// //                       Text('Please select a category',
// //                           style: TextStyle(fontSize: 18, color: Colors.grey)),
// //                     ],
// //                   );
// //                 }
// //                 return ListView.builder(
// //                   itemCount: selectedCategory.subCategories.length,
// //                   itemBuilder: (context, index) {
// //                     var subCategory = selectedCategory.subCategories[index];
// //                     //    print(subCategory.name);

// //                     var isExpanded = categoryController.expandedSubCategories
// //                         .contains(subCategory);
// //                     bool isSubSelected =
// //                         categoryController.selectedSubCategory.value ==
// //                             subCategory;

// //                     return ExpansionTile(
// //                       leading:
// //                           // Image.network(
// //                           //   subCategory.image,
// //                           //   height: 40,
// //                           //   width: 40,
// //                           // ),
// //                           CustomImageView(
// //                         imagePath: "assets/cell-phone.png",
// //                         height: 40,
// //                         width: 40,
// //                       ),
// //                       title: Text(subCategory.name),
// //                       children: isExpanded
// //                           ? [
// //                               GridView.builder(
// //                                 shrinkWrap: true,
// //                                 physics: NeverScrollableScrollPhysics(),
// //                                 gridDelegate:
// //                                     SliverGridDelegateWithFixedCrossAxisCount(
// //                                   crossAxisCount: 3,
// //                                   childAspectRatio: 0.75,
// //                                 ),
// //                                 itemCount: subCategory.subProducts.length,
// //                                 itemBuilder: (context, subIndex) {
// //                                   var subProduct =
// //                                       subCategory.subProducts[subIndex];
// //                                   return GestureDetector(
// //                                     onTap: () {
// //                                       categoryController.selectedSubCategory
// //                                           .value = subCategory;
// //                                       setState(() {});
// //                                     },
// //                                     child: GridTile(
// //                                       child: Column(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.center,
// //                                         children: [
// //                                           SizedBox(
// //                                             height: 80,
// //                                             child: AspectRatio(
// //                                               aspectRatio: 1,
// //                                               child:
// //                                                   // Image.network(
// //                                                   //     subProduct.image,
// //                                                   //     fit: BoxFit.cover),

// //                                                   CustomImageView(
// //                                                 imagePath: "assets/iphone.png",
// //                                                 height: 40,
// //                                                 width: 40,
// //                                               ),
// //                                             ),
// //                                           ),
// //                                           SizedBox(height: 4),
// //                                           Text(
// //                                             subProduct.name,
// //                                             textAlign: TextAlign.center,
// //                                             style: TextStyle(fontSize: 12),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   );
// //                                 },
// //                               ),
// //                             ]
// //                           : [],
// //                       onExpansionChanged: (expanded) {
// //                         categoryController.toggleSubCategory(subCategory);

// //                         categoryController.selectedSubCategory.value =
// //                             expanded ? subCategory : null;
// //                         setState(() {});
// //                       },
// //                     );
// //                   },
// //                 );
// //               }),
// //             ),
// //           ],
// //         );
// //       }),
// //     );
// //   }
// // }
// ///////////////////////////////////////////////
// // condition for name or both name and image can show...

// // lib/views/category_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:softminion/Ssystem_Architecture/Controller/category_data_controller.dart';
// import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/all_bottom_screen_add.dart';
// import 'package:softminion/widgets/custom_image_view.dart';

// class CategoriesBottomScreen extends StatefulWidget {
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoriesBottomScreen> {
//   final CategoryController categoryController = Get.put(CategoryController());

//   @override
//   void initState() {
//     super.initState();
//     print("category screen entry");
//     categoryController.selectedCategory.bindStream(categoryController
//         .categories.stream
//         .map((categories) => categories.isNotEmpty ? categories.first : null));
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("category screen widget");

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.offAll(() => AllBottomScreenAdd());
//             print("category screen back button");
//           },
//         ),
//         title: Obx(() {
//           var selectedSubCategory =
//               categoryController.selectedSubCategory.value;
//           if (selectedSubCategory != null) {
//             return Text(selectedSubCategory.name);
//           }
//           var selectedCategory = categoryController.selectedCategory.value;
//           return Text(selectedCategory?.name ?? 'Categories');
//         }),
//       ),
//       body: Obx(() {
//         if (categoryController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: Colors.grey[200],
//                 child: ListView.builder(
//                   itemCount: categoryController.categories.length,
//                   itemBuilder: (context, index) {
//                     var category = categoryController.categories[index];
//                     bool isSelected =
//                         categoryController.selectedCategory.value == category;

//                     return GestureDetector(
//                       onTap: () {
//                         categoryController.selectCategory(category);
//                         categoryController.selectedSubCategory.value = null;
//                         setState(() {});
//                       },
//                       child: Container(
//                         color: isSelected
//                             ? Colors.white
//                             : Color.fromARGB(255, 215, 211, 211),
//                         padding: EdgeInsets.symmetric(
//                             vertical: 8.0, horizontal: 4.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             if (category.image != null)
//                               Image.asset(
//                                 category.image!,
//                                 height: 40,
//                                 width: 40,
//                                 color: isSelected ? Colors.red : Colors.black,
//                               ),
//                             SizedBox(height: 4),
//                             Text(
//                               category.name,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: isSelected ? Colors.red : Colors.black,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: Obx(() {
//                 var selectedCategory =
//                     categoryController.selectedCategory.value;
//                 if (selectedCategory == null) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.category, size: 80, color: Colors.grey),
//                       SizedBox(height: 20),
//                       Text('Please select a category',
//                           style: TextStyle(fontSize: 18, color: Colors.grey)),
//                     ],
//                   );
//                 }
//                 return ListView.builder(
//                   itemCount: selectedCategory.subCategories.length,
//                   itemBuilder: (context, index) {
//                     var subCategory = selectedCategory.subCategories[index];
//                     var isExpanded = categoryController.expandedSubCategories
//                         .contains(subCategory);
//                     bool isSubSelected =
//                         categoryController.selectedSubCategory.value ==
//                             subCategory;

//                     return ExpansionTile(
//                       leading: subCategory.image != null
//                           ? Image.asset(
//                               subCategory.image!,
//                               height: 40,
//                               width: 40,
//                             )
//                           : null,
//                       title: Text(subCategory.name),
//                       children: isExpanded
//                           ? [
//                               GridView.builder(
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 gridDelegate:
//                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3,
//                                   childAspectRatio: 0.75,
//                                 ),
//                                 itemCount: subCategory.subProducts.length,
//                                 itemBuilder: (context, subIndex) {
//                                   var subProduct =
//                                       subCategory.subProducts[subIndex];
//                                   return GestureDetector(
//                                     onTap: () {
//                                       categoryController.selectedSubCategory
//                                           .value = subCategory;
//                                       setState(() {});
//                                     },
//                                     child: GridTile(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           if (subProduct.image != null)
//                                             SizedBox(
//                                               height: 80,
//                                               child: AspectRatio(
//                                                 aspectRatio: 1,
//                                                 child: CustomImageView(
//                                                   imagePath:
//                                                       "assets/images/iphone.png",
//                                                   height: 40,
//                                                   width: 40,
//                                                 ),
//                                               ),
//                                             ),
//                                           SizedBox(height: 4),
//                                           Text(
//                                             subProduct.name,
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(fontSize: 12),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ]
//                           : [],
//                       onExpansionChanged: (expanded) {
//                         categoryController.toggleSubCategory(subCategory);

//                         categoryController.selectedSubCategory.value =
//                             expanded ? subCategory : null;
//                         setState(() {});
//                       },
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
