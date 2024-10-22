import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'dart:convert';

import 'package:softminion/Ssystem_Architecture/Model/all_class_model/product_attributes.dart';

class ApiProductAttributes {
  final String baseUrl =
      AppEnvironment.baseApiUrl + ApiEndpoints.productAttributes;

  Future<List<ProductAttributesModel>> fetchData() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: AppEnvironment.headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print('Fetched data: $data');
      return data.map((item) => ProductAttributesModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
