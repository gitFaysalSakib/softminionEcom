import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/All%20Product%20View%20Page/product_display.dart';
import 'package:softminion/widgets/app_bar/app_bar_search_controller.dart/app_bar_search_controller.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final AllProductListController allProductadataController =
      Get.find(); // Access the controller
  final FocusNode _focusNode = FocusNode(); // Add a FocusNode

  @override
  Widget build(BuildContext context) {
    final SearchControllerIconOfIconOn searchController =
        Get.put(SearchControllerIconOfIconOn());

    return Container(
      height: 110.0,
      color: Colors.white,
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
              isSearching
                  ? Padding(
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
                          // allProductadataController
                          //     .fetchDataFromApiServicePageSetDynamically(); // Refetch without search
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Image.asset(
                        'assets/images/Soft-Minion-Logo.png',
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
              Expanded(
                child: isSearching
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
                                                .fetchDataFromApiServicePageSetDynamically(); // Refetch without search
                                          },
                                        )
                                      : null,
                                ),
                                style: TextStyle(color: Colors.black),
                                onChanged: (text) {
                                  allProductadataController.searchText.value =
                                      text; // Update controller's searchText
                                  allProductadataController
                                      .fetchDataFromApiServicePageSetDynamically(); // Fetch filtered data
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.search,
                                color: Colors.black, size: 28.0),
                            onPressed: () {
                              searchController.isSearching.value = true;
                              _focusNode.requestFocus(); // Focus the TextField

                              Get.to(() =>
                                  ProductDisplay()); // Navigate to ProductDisplay page
                            },
                          ),
                          IconButton(
                            icon: Icon(Iconsax.notification,
                                color: Colors.black, size: 28.0),
                            onPressed: () {},
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
