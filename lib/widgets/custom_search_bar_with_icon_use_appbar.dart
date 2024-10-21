import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';
import 'package:softminion/card_all/add_to_cart_item_view_build.dart';

class CustomAppBarForSearchBarAndCartIcon extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.red,
              size: 40,
            ),
            onPressed: () {
              Get.offAllNamed('/');
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
          Stack(
            children: [
              IconButton(
                icon: Icon(Iconsax.shopping_cart, color: Colors.red),
                onPressed: () {
                  Get.to(CartView());
                },
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Obx(() {
                  return cartController.cartItemCount > 0
                      ? Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${cartController.cartItemCount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : SizedBox.shrink();
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
