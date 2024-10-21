import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/end_point/all_end_point.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/customer_login_model.dart';

class LoginApiService {
  final String baseUrl = AppEnvironment.baseApiUrl +
      ApiEndpoints.customerLongin; // Adjust endpoint as needed

  Future<Map<String, dynamic>?> login(CustomerLoginModel customer) async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.post(
        url,
        headers: {
          ...AppEnvironment.headers,
          'Content-Type': 'application/json',
        },
        body: json.encode(customer.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response to extract the token and other user details
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey('token')) {
          // Return the token and other data
          return responseData; // This will include token, email, etc.
        } else {
          print('Token not found in response');
          return null;
        }
      } else {
        print('Failed to log in: ${response.statusCode} ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }
}
