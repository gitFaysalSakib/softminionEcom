import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'dart:convert';
//default api call.....
// class ApiServiceAllProductsList {
//   final String baseUrl =
//       AppEnvironment.baseApiUrl + ApiEndpoints.allProductListEndPoint;

//   Future<List<AllProductsListModel>> fetchData() async {
//     final response =
//         await http.get(Uri.parse(baseUrl), headers: AppEnvironment.headers);

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((item) => AllProductsListModel.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
// }

// here modify call page number and per page how many product show....
// class ApiServiceAllProductsList {
//   final String baseUrl =
//       AppEnvironment.baseApiUrl + ApiEndpoints.allProductListEndPoint;

//   Future<List<AllProductsListModel>> fetchData(
//       {int page = 1, int perPage = 12}) async {
//     final response = await http.get(
//       Uri.parse('$baseUrl?page=$page&per_page=$perPage'),
//       headers: AppEnvironment.headers,
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);

//       return data.map((item) => AllProductsListModel.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
// }

//filter add in api..
class ApiServiceAllProductsList {
  final String baseUrl =
      AppEnvironment.baseApiUrl + ApiEndpoints.allProductListEndPoint;

  // Modify the method to accept an optional search query
  Future<List<AllProductsListModel>> fetchData({
    int? page,
    int? perPage,
    String? searchQuery, // Optional search query
    int? categoryId, // Optional category ID for filtering
    List<String>? attributes, // Optional list of selected attribute values
  }) async {
    // Build the query parameters
    Map<String, String> queryParams = {
      'page': page.toString(),
      'per_page': perPage.toString(),
    };

    // Add the search query if provided
    if (searchQuery != null && searchQuery.isNotEmpty) {
      queryParams['search'] = searchQuery;
    }

    // Add the category ID if provided
    if (categoryId != null) {
      queryParams['category'] = categoryId.toString();
    }

    // Add the attributes as a comma-separated string if provided
    if (attributes != null && attributes.isNotEmpty) {
      queryParams['attributes'] = attributes.join(',');
    }

    // Build the final URI with the query parameters
    Uri uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
    // Build the URI with search query if provided
    final response = await http.get(
      uri,
      headers: AppEnvironment.headers,
    );
    // if (searchQuery != null && searchQuery.isNotEmpty) {
    //   uri = uri.replace(queryParameters: {
    //     ...uri.queryParameters,
    //     'search': searchQuery, // Add search query to parameters
    //   });
    // }

    // final response = await http.get(
    //   uri,
    //   headers: AppEnvironment.headers,
    // );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => AllProductsListModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
