import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/bottom_navigation_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/card_bottom_page/card_bottom_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/category_bottom_page/category_bottom_screen_new.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/favorites_bottom_page/favorites_bottom_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/home_bottom_screen_page.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/profile_bottom_page/profile_bottom_screen.dart';
import 'package:softminion/widgets/custom_bottom_navigationbar.dart';

class AllBottomScreenAdd extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> pages = [
    HomeBottomScreen(),
    CategoriesBottomScreen(),
    CardBottomScreen(),
    FavoritesBottomScreen(),
    ProfileBottomScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print("allBottom Screen");
    return Obx(() {
      return Scaffold(
        body: pages[navigationController.selectedIndex.value],
        bottomNavigationBar: CustomBottomNavigationBar(),
      );
    });
  }
}
