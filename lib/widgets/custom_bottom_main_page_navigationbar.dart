import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/bottom_navigation_controller.dart';
import 'package:softminion/widgets/custom_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              spreadRadius: 2.w,
              blurRadius: 2.w,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: navigationController.selectedIndex.value,
          onTap: (index) {
            navigationController.changeIndex(index);
            print(navigationController.selectedIndex.value);
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: Iconsax.home,
                unselectedColor: Colors.black,
                isSelected: navigationController.selectedIndex.value == 0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                unselectedColor: Colors.black,
                icon: Iconsax.category,
                isSelected: navigationController.selectedIndex.value == 1,
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: Iconsax.shopping_cart,
                unselectedColor: Colors.black,
                isSelected: navigationController.selectedIndex.value == 2,
              ),
              label: 'Bag',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                unselectedColor: Colors.black,
                icon: Iconsax.lovely,
                isSelected: navigationController.selectedIndex.value == 3,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                unselectedColor: Colors.black,
                icon: Iconsax.profile_add,
                isSelected: navigationController.selectedIndex.value == 4,
              ),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
