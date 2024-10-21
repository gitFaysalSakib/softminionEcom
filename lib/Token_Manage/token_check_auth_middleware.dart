import 'package:get/get.dart';
import 'package:softminion/Token_Manage/token_store.dart';

class AuthMiddleware {
  final TokenService tokenService = Get.find<TokenService>();

  Future<bool> checkUserLoggedIn() async {
    var isLoggedIn = await tokenService.isLoggedIn();
    if (!isLoggedIn) {
      Get.snackbar(
        'Login Required',
        'Please log in to proceed.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );

      // Use Get.previousRoute to get the correct route if current route is '/'
      final currentRoute =
          Get.currentRoute != '/' ? Get.currentRoute : Get.previousRoute;

      // Print the current route to debug

      await Future.delayed(const Duration(seconds: 3));

      // Redirect to the login page, passing the current route name
      Get.toNamed('/login', arguments: currentRoute);

      return false;
    }
    return true;
  }
}
