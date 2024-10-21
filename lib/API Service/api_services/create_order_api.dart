import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/create_order_model.dart';

class ApiServiceCreateOrder {
  final String baseUrl = AppEnvironment.baseApiUrl + ApiEndpoints.createOrder;

  Future<bool> createOrderByPostMethod(
      CreateOrderModel createOrderModel) async {
    final url = Uri.parse(baseUrl); // Ensure the URL is correct

    try {
      final response = await http.post(
        url,
        headers: {
          ...AppEnvironment.headers, // Spread operator to include headers
          'Content-Type': 'application/json',
        },
        body: json.encode(createOrderModel.toJson()),
      );
      if (response.body != null) {
        final responseData = json.decode(response.body);

        // Check if the response has a message field and print it
        if (responseData['message'] != null) {
          print('Server message: ${responseData['message']}');
        } else {
          print('Success but no message in the response');
        } // Parse the response if necessary (for now we return true)
        // You can implement additional parsing here if needed
        return true;
      } else {
        // Log the error response for debugging
        print('Failed to order: ${response.statusCode} ${response.body}');
        return false;
      }
    } catch (e) {
      // Handle connection errors and log them
      print('Error during order: $e');
      return false;
    }
  }

//get method...
  Future<List<CreateOrderModel>> fetchSpecificUserOrders(int customerId) async {
    final url = Uri.parse('$baseUrl?customer=$customerId');

    try {
      final response = await http.get(url, headers: AppEnvironment.headers);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) {
          return CreateOrderModel.fromJson(item);
        }).toList();
      } else if (response.statusCode == 401) {
        print('Unauthorized: ${response.body}');
        return [];
      } else {
        print('Failed to load orders: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error occurred while fetching orders: $e');
      return [];
    }
  }
}
