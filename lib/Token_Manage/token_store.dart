import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService extends GetxService {
  // Observable token, username, and userId
  var token = ''.obs;
  var userName = ''.obs;
  var userId = ''.obs;

  // Initialize the token service by loading the token, username, and userId from SharedPreferences
  Future<TokenService> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? ''; // Load token from storage
    userName.value = prefs.getString('user_display_name') ??
        ''; // Load username from storage
    userId.value = prefs.getString('user_id') ?? ''; // Load userId from storage
    return this;
  }

  // Method to store the token globally and persist it
  Future<void> storeToken(String newToken) async {
    token.value = newToken; // Update token in memory
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newToken); // Persist token in storage
  }

  // Method to store the username and persist it
  Future<void> storeUername(String getUserName) async {
    userName.value = getUserName; // Update username in memory
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'user_display_name', getUserName); // Persist username in storage
  }

  // Method to store the userId and persist it
  Future<void> storeUserId(String newUserId) async {
    userId.value = newUserId; // Update userId in memory
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', newUserId); // Persist userId in storage
  }

  // Method to check if the user is logged in
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  // Method to clear the token, username, and userId (use this for logout)
  Future<void> clearToken() async {
    token.value = ''; // Clear token in memory
    userName.value = ''; // Clear username in memory
    userId.value = ''; // Clear userId in memory

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Remove token from storage
    await prefs.remove('user_display_name'); // Remove username from storage
    await prefs.remove('user_id'); // Remove userId from storage
  }

  // Method to check if a token exists
  bool hasToken() {
    return token.value.isNotEmpty;
  }

  // Method to decode the token and extract user ID
  void decodeToken(String jwtToken) {
    // Split the token by '.' and decode the payload (2nd part)
    final parts = jwtToken.split('.');
    if (parts.length != 3) {
      return;
    }

    final payload = parts[1];
    final decodedPayload =
        utf8.decode(base64Url.decode(base64Url.normalize(payload)));
    final payloadMap = json.decode(decodedPayload);

    // Check if 'data' and 'user' keys exist
    if (payloadMap.containsKey('data') && payloadMap['data']['user'] != null) {
      userId.value =
          payloadMap['data']['user']['id'].toString(); // Extract user ID

      // Persist the userId in SharedPreferences
      storeUserId(userId.value); // Store userId persistently
    } else {}
  }
}
