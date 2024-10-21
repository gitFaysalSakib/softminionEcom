import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/customer_login_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/customer_login_model.dart';
import 'package:softminion/Token_Manage/token_store.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var loginError = ''.obs;
  //var userDisplayName = ''.obs; // New variable to store user_nicename

  final LoginApiService apiService = LoginApiService();
  final TokenService tokenService = Get.find<TokenService>();
  Future<void> login() async {
    isLoading.value = true;
    loginError.value = '';

    final customer = CustomerLoginModel(
      username: username.value,
      password: password.value,
    );

    final response = await apiService.login(customer);
    final previousRoute = Get.arguments;

    if (response != null && response['token'] != null) {
      String token =
          response['token'] ?? ''; // Fallback to empty string if null
      String userDisplayName =
          response['user_display_name'] ?? ''; // Handle null

      await tokenService.storeToken(token);
      // Decode the token to extract the user ID
      tokenService.decodeToken(token);
      // Now store the decoded user ID
      if (tokenService.userId.value.isNotEmpty) {
        await tokenService.storeUserId(tokenService.userId.value);
      }
      await tokenService.storeUername(userDisplayName);

      // Handle redirection after login
      if (previousRoute is Map<String, dynamic>) {
        final redirectTo = previousRoute['redirectTo'] ?? '/';
        final productId = previousRoute['productId'];
        String convertID = productId.toString();

        // Redirect back to the product details page after login
        Get.offNamed(redirectTo, arguments: {'productId': convertID});
      } else if (previousRoute != null) {
        Get.offNamed(previousRoute);
      } else {
        Get.offNamed('/');
      }
    } else {
      loginError.value = 'Login failed. Please try again.';
    }

    isLoading.value = false;
  }

  // Method to log out the user
  Future<void> logout() async {
    await tokenService.clearToken();
    Get.offAllNamed('/');
  }
}
