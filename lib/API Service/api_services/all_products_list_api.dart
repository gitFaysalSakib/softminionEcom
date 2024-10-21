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
class ApiServiceAllProductsList {
  final String baseUrl =
      AppEnvironment.baseApiUrl + ApiEndpoints.allProductListEndPoint;

  Future<List<AllProductsListModel>> fetchData(
      {int page = 1, int perPage = 12}) async {
    final response = await http.get(
      Uri.parse('$baseUrl?page=$page&per_page=$perPage'),
      headers: AppEnvironment.headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => AllProductsListModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
