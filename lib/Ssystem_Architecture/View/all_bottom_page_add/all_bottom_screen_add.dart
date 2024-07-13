import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/View/home_bottom_page/home_bottom_screen.dart';

import '../../Controller/bottom_navigation_controller.dart';

class AllBottomScreenAdd extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> pages = [
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pages[navigationController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationController.selectedIndex.value,
          onTap: (index) {
            navigationController.changeIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
