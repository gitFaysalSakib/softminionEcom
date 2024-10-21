import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/customer_sign_up_and_address_model.dart';

class ApiServiceCustomerSignUpAuth {
  final String baseUrl =
      AppEnvironment.baseApiUrl + ApiEndpoints.customerSignUp;

  Future<bool> signUp(CustomerSignUpAndAddressModel customer) async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.post(
        url,
        headers: {
          ...AppEnvironment.headers, // Spread operator to include headers
          'Content-Type': 'application/json',
        },
        body: json.encode(customer.toJson()),
      );

      // Check the response status
      if (response.statusCode == 200 || response.statusCode == 201) {
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
        print('Failed to sign up: ${response.statusCode} ${response.body}');
        return false;
      }
    } catch (e) {
      // Handle connection errors and log them
      print('Error during sign up: $e');
      return false;
    }
  }
}
