import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/customer_sign_up_and_address_model.dart';
import 'dart:convert';

class ApiServiceUserAddress {
  // Define the base URL with the customer endpoint
  final String baseUrl =
      AppEnvironment.baseApiUrl + ApiEndpoints.customerAddressEndPoint;

  /// Fetch existing customer details (including addresses) using GET
  Future<CustomerSignUpAndAddressModel?> fetchCustomerDetails(
      int userId) async {
    try {
      final response = await http
          .get(
            Uri.parse('$baseUrl/$userId'),
            headers: AppEnvironment.headers,
          )
          .timeout(const Duration(seconds: 10)); // Set a timeout

      // Check if the response is successful
      if (response.body != null) {
        // Decode the response body
        Map<String, dynamic> data = json.decode(response.body);
        // print(data);

        // Return model object
        return CustomerSignUpAndAddressModel.fromJson(data);
      } else {
        // Handle the error by returning null or logging it
        return null;
      }
    } catch (e) {
      // Log or handle any exceptions here (e.g., timeout, network error)
      print('Error occurred while fetching customer details: $e');
      return null; // Or you can throw an error based on your use case
    }
  }

  /// Update customer details using PUT and passing userId in the URL
  Future<bool> updateCustomerDetails(
      int userId, CustomerSignUpAndAddressModel customerModel) async {
    try {
      String body = json.encode(customerModel.toJson());

      // Use PUT method for updating customer details
      final response = await http
          .put(
            Uri.parse('$baseUrl/$userId'), // Passing userId in the URL
            headers: {
              'Content-Type': 'application/json',
              ...AppEnvironment.headers,
            },
            body: body,
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to update customer details: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while updating customer details: $e');
      return false;
    }
  }
}
