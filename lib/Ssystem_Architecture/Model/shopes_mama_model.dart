// import 'package:get/get.dart';

// class ShopesMamaModel {
//   ShopesMamaModel({
//     required this.name,
//     required this.status,
//     required this.images,
//     required this.price,
//     required this.type,
//   });

//   RxString name;

//   RxString status;
//   RxList<Images> images;
//   RxList<Category> type;

//   RxInt price;

//   // Factory constructor to map JSON data
//   factory ShopesMamaModel.fromJson(Map<String, dynamic> json) {
//     return ShopesMamaModel(
//       name: (json['name'] ?? '').toString().obs,
//       status: (json['status'] ?? '').toString().obs,

//       images: (json['images'] as List<dynamic>?)
//               ?.map((imageJson) => Images.fromJson(imageJson))
//               .toList()
//               .obs ??
//           <Images>[].obs,

//       type: (json['categories'] as List<dynamic>?)
//               ?.map((categoryJson) => Category.fromJson(categoryJson))
//               .toList()
//               .obs ??
//           <Category>[].obs,
//       price: ((json['price'] ?? 0) is int
//               ? (json['price'] as int)
//               : int.tryParse(json['price'].toString()) ?? 0)
//           .obs, // Initialize with an empty list if null
//     );
//   }
// }

// class Images {
//   RxString imageLink;

//   Images({String? imageLink})
//       : imageLink = (imageLink ?? '').obs; // Initialize as empty string if null

//   // Factory constructor to map JSON data
//   factory Images.fromJson(Map<String, dynamic> json) {
//     return Images(
//       imageLink: json['src'] as String?,
//     );
//   }
// }

// class Category {
//   RxString categoryType;

//   Category({String? categoryType})
//       : categoryType =
//             (categoryType ?? '').obs; // Initialize as empty string if null

//   // Factory constructor to map JSON data
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       categoryType: json['name'] as String?,
//     );
//   }
// }
