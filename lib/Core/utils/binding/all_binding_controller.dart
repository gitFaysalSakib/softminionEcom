import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_login_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_sign_up_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_variation_controller.dart';
import 'package:softminion/Token_Manage/token_check_auth_middleware.dart';
import 'package:softminion/Token_Manage/token_store.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllProductListController());

    Get.lazyPut(() => CartController());
    // Instead of lazy loading ProductVariationController directly,
    // create a method to initialize it when you have the productId.
    Get.lazyPut<ProductVariationController>(() => ProductVariationController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignupController());

    Get.lazyPut(() => AuthMiddleware());
    Get.lazyPut(() => TokenService());
    Get.lazyPut(() => CategoriesController());
  }
}
