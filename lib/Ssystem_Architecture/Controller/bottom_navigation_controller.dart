import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/category_bottom_page/category_bottom_screen_new.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/favorites_bottom_page/favorites_bottom_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_screen/home_bottom_screen_page.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_profile_screen/user_first_profile_page.dart';
import 'package:softminion/card_all/add_to_cart_item_view_build.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  // Define your pages here
  final List<Widget> pages = [
    HomeBottomScreenTWO(),
    CategoriesBottomScreen(),
    CartView(),
    FavoritesBottomScreen(),
    UserFirstProfilePage(),
  ];

  // // Method to change the index and navigate
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  // Get the current page
  Widget getCurrentPage() {
    return pages[selectedIndex.value];
  }
}
