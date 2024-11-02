import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'dart:convert';

import 'package:softminion/Ssystem_Architecture/Model/all_class_model/single_attributes_value_model.dart';

class ApiSingleAttributesValue {
  Future<List<SingleAttributesValueModel>> fetchData(int attributesId) async {
    final String baseUrl =
        '${AppEnvironment.baseApiUrl}${ApiEndpoints.getSingleAttributesValue(attributesId)}';
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization':
            'Basic Y2tfMWU4ZjNiOTRmNmExNTlhODBjOWFjOTI4MjkyNzI5YTI4ODNjMGRlZDpjc18zZDFlYzRmZDc3ZDQyZjkyOWRjZjUxMGFjMzM4Mjg3ZDdkMGMwNjZj',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => SingleAttributesValueModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
