import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/bottom_navigation_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/All%20Product%20View%20Page/product_display.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';
import 'package:softminion/card_all/add_to_cart_item_view_build.dart';
import 'package:softminion/widgets/app_bar/app_bar_search_controller.dart/app_bar_search_controller.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final AllProductListController allProductadataController = Get.find();
  final FocusNode _focusNode = FocusNode();
  final CartController cartController = Get.find<CartController>();
  final NavigationController navigationController =
      Get.put(NavigationController());

  final bool showCartIcon;
  final bool showBackButton;
  final bool showSearchBar; // New parameter to control search bar visibility

  CustomAppBar({
    Key? key,
    this.showCartIcon = false,
    this.showBackButton = false,
    this.showSearchBar = true, // Default to true to show search bar by default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchControllerIconOfIconOn searchController =
        Get.put(SearchControllerIconOfIconOn());

    return Container(
      height: 110.0,
      color: Colors.white10,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 56.0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Obx(() {
          bool isSearching = searchController.isSearching.value;

          return Row(
            children: [
              if (showBackButton && !isSearching)
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);

                      if (Get.currentRoute == '/') {
                        allProductadataController.selectedCategoryaName.value =
                            '';
                      }
                    },
                  ),
                ),
              if (showSearchBar && isSearching)
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      searchController.isSearching.value = false;
                      _searchController.clear();
                      _focusNode
                          .unfocus(); // Unfocus when back button is clicked
                      allProductadataController.searchText.value =
                          ''; // Clear search in controller
                      // print(Get.previousRoute);
                      if (Get.previousRoute == '/product_display') {
                        print("Current Route: ${Get.currentRoute}");
                        print("Previous Route: ${Get.previousRoute}");
                        // Get.to(CartView());
                      } else if (Get.currentRoute == '/product_display') {
                        Navigator.pop(context);
                        //  Get.back();
                      }

                      // else if (Get.currentRoute == '/product_display') {
                      //   Get.to(CartView());
                      // }
                    },
                  ),
                )
              else if (!showSearchBar || !isSearching)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Image.asset(
                    'assets/images/Soft-Minion-Logo.png',
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
              Expanded(
                child: showSearchBar && isSearching
                    ? Container(
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  suffixIcon: _searchController.text.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(Icons.close,
                                              color: Colors.grey),
                                          onPressed: () {
                                            _searchController.clear();
                                            allProductadataController
                                                .searchText.value = '';
                                            allProductadataController
                                                .fetchDataFromApiServicePageSetDynamically();
                                          },
                                        )
                                      : null,
                                ),
                                style: TextStyle(color: Colors.black),
                                onChanged: (text) {
                                  allProductadataController.searchText.value =
                                      text;
                                  allProductadataController
                                      .fetchDataFromApiServicePageSetDynamically();
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (showSearchBar)
                            IconButton(
                              icon: Icon(Icons.search,
                                  color: Colors.black, size: 28.0),
                              onPressed: () {
                                searchController.isSearching.value = true;
                                _focusNode
                                    .requestFocus(); // Focus the TextField
                                Get.toNamed('/product_display');
                              },
                            ),
                          Stack(
                            children: [
                              IconButton(
                                icon: showCartIcon
                                    ? Icon(Iconsax.shopping_cart,
                                        color: Colors.black)
                                    : Icon(Iconsax.notification,
                                        color: Colors.black, size: 28.0),
                                onPressed: () {
                                  if (showCartIcon) {
                                    Get.to(CartView());
                                  }
                                },
                              ),
                              if (showCartIcon)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Obx(() {
                                    return cartController.cartItemCount > 0
                                        ? Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                )
                            ],
                          ),
                        ],
                      ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
