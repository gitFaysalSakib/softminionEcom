import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/Core/import_file_all.dart';
import 'package:softminion/Ssystem_Architecture/View/add%20to%20cart/my_cart_page_view.dart';

class CustomAppBarForSearchBarAndCartIcon extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Iconsax.backward, color: Colors.red),
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(
            child: Container(
              height: 35.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                border: Border.all(
                  color: Colors.red, // Red border color
                  width: 2.0, // Increase the width to make the border bold
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  // hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none, // No default border
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.red), // Search icon
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Iconsax.shopping_cart, color: Colors.red),
            onPressed: () {
              Get.to(MyCartPage());
            },
          ),
        ],
      ),
    );
  }
}
