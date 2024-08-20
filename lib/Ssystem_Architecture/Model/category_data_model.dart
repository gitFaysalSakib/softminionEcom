// // // lib/models/category.dart
// // class Category {
// //   final String name;
// //   final String image;
// //   final List<SubCategory> subCategories;

// //   Category({
// //     required this.name,
// //     required this.image,
// //     required this.subCategories,
// //   });
// // }

// // class SubCategory {
// //   final String name;
// //   final String image; // Added image field
// //   final List<SubProduct> subProducts;

// //   SubCategory({
// //     required this.name,
// //     required this.image, // Added image field
// //     required this.subProducts,
// //   });
// // }

// // class SubProduct {
// //   final String name;
// //   final String image;

// //   SubProduct({
// //     required this.name,
// //     required this.image,
// //   });
// // }

// /////////////
// /// // condition for name or both name and image can show...
// class Category {
//   final String name;
//   final String? image; // Make image field optional
//   final List<SubCategory> subCategories;

//   Category({
//     required this.name,
//     this.image, // Make image field optional
//     required this.subCategories,
//   });
// }

// class SubCategory {
//   final String name;
//   final String? image; // Make image field optional
//   final List<SubProduct> subProducts;

//   SubCategory({
//     required this.name,
//     this.image, // Make image field optional
//     required this.subProducts,
//   });
// }

// class SubProduct {
//   final String name;
//   final String? image; // Make image field optional

//   SubProduct({
//     required this.name,
//     this.image, // Make image field optional
//   });
// }
