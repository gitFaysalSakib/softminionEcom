import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/widgets/app_bar/app_bar_search_controller.dart/app_bar_search_controller.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final AllProductListController allProductadataController =
      Get.find(); // Access the controller

  @override
  Widget build(BuildContext context) {
    final SearchControllerIconOfIconOn searchController =
        Get.put(SearchControllerIconOfIconOn());

    return Container(
      height: 56.0,
      color: Colors.white,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 56.0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Obx(() {
          return Row(
            children: [
              searchController.isSearching.value
                  ? Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          searchController.isSearching.value = false;
                          _searchController.clear();
                          allProductadataController.searchText.value =
                              ''; // Clear search in controller
                          allProductadataController
                              .fetchDataFromApiServicePageSetDynamically(); // Refetch without search
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Image.asset(
                        'assets/images/soft_remove_background.png',
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
              Expanded(
                child: searchController.isSearching.value
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
                                  print(allProductadataController
                                      .searchText.value);
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
                            },
                          ),
                          const SizedBox(width: 8.0),
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
