import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/payment_method_model.dart';
import 'dart:convert';

class ApiServicePaymentMethod {
  final String baseUrl = AppEnvironment.baseApiUrl + ApiEndpoints.paymentMethod;

  Future<List<PaymentMethodModel>> fetchData() async {
    final response =
        await http.get(Uri.parse(baseUrl), headers: AppEnvironment.headers);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      //  print(data);
      return data.map((item) => PaymentMethodModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
