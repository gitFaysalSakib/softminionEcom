// import 'package:dio/dio.dart'; // or any HTTP client you prefer
// import 'package:softminion/Ssystem_Architecture/Model/demoCategrory.dart';

// class CategoryService {
//   final Dio _dio = Dio();

//   Future<List<Category>> fetchCategories() async {
//     try {
//       final response = await _dio.get('https://yourapi.com/categories');
//       // Replace this with actual data mapping from API response
//       List<Category> categories = (response.data as List)
//           .map((json) => Category.fromJson(json))
//           .toList();
//       return categories;
//     } catch (e) {
//       print('Error fetching categories: $e');
//       return [];
//     }
//   }
// }
