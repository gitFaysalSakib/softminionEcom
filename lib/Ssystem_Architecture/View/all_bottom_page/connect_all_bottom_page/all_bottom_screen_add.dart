import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/bottom_navigation_controller.dart';
import 'package:softminion/widgets/bottom_main_page_navigator/custom_bottom_main_page_navigationbar.dart';

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
