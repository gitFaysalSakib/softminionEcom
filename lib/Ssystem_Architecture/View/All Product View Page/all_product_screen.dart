import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_sign_up_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/payment_method_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/bottom_navigation_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Ssystem_Architecture/View/All%20Product%20View%20Page/product_display.dart';
import 'package:softminion/Token_Manage/token_store.dart';
import 'package:softminion/widgets/app_bar/custom_app_bar.dart';
import 'package:softminion/widgets/custom_bottom_main_page_navigationbar.dart';

class AllProductScreen extends StatelessWidget {
  AllProductScreen({Key? key}) : super(key: key);

  final HomePageScrenController homePageScrenController =
      Get.put(HomePageScrenController());
  final AllProductListController allProductadataController =
      Get.put(AllProductListController());
  AllProductsListModel? _homeProductModel;
  final PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final SignupController signupController = Get.put(SignupController());
  final TokenService tokenService = Get.find<TokenService>();
  final NavigationController navigationController = Get.put(
      NavigationController()); // Get the existing NavigationController instance

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(child: CustomAppBar()),
              ],
            ),
            backgroundColor: Colors.white, // AppBar background color
            automaticallyImplyLeading: false, // Remove default back button
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: ProductDisplay(), // Use ProductDisplay directly
              ),
            ],
          )

          // bottomNavigationBar: CustomBottomNavigationBar(),
          ),
    );
  }
}
