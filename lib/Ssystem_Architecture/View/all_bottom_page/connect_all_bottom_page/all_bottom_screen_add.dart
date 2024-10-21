import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/bottom_navigation_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/category_bottom_page/category_bottom_screen_new.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/favorites_bottom_page/favorites_bottom_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_screen/home_bottom_screen_page.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_profile_screen/user_first_profile_page.dart';
import 'package:softminion/card_all/add_to_cart_item_view_build.dart';
import 'package:softminion/widgets/custom_bottom_main_page_navigationbar.dart';

class AllBottomScreenAdd extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    // print("allBottom Screen");

    return Scaffold(
      body: Obx(() => navigationController.getCurrentPage()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
