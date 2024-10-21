import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/widgets/app_bar/app_bar_search_controller.dart/app_bar_search_controller.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.leadingWidth,
    this.centerTitle,
    this.title,
    this.backgroundColor,
    this.logoPath = 'assets/images/soft_remove_background.png',
    this.searchIconAction,
    this.notificationIconAction,
  }) : super(key: key);

  final double? height;
  final double? leadingWidth;
  final bool? centerTitle;
  final Widget? title;
  final Color? backgroundColor;
  final String? logoPath;
  final VoidCallback? searchIconAction;
  final VoidCallback? notificationIconAction;

  // Adding TextEditingController to manage the search text
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SearchControllerIconOfIconOn searchController =
        Get.put(SearchControllerIconOfIconOn()); // Initialize the controller

    return Container(
      height: 56.0, // Set a fixed height for your app bar
      color: backgroundColor ?? Colors.white, // Background color
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: height ?? 56.0,
        automaticallyImplyLeading: false,
        leadingWidth: leadingWidth ?? 56.0,
        centerTitle: false, // Disable centering when the search bar is open
        titleSpacing: 0, // Remove any default spacing to control custom layout
        title: Obx(() {
          return Row(
            children: [
              // Back Arrow or Logo
              searchController.isSearching.value
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 4.0, right: 4.0), // Add consistent padding
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          searchController.isSearching.value = false;
                          _searchController.clear(); // Clear search text
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0), // Adjust padding for the logo
                      child: Image.asset(
                        logoPath!,
                        height: 60, // Adjust height as needed
                        fit: BoxFit.contain,
                      ),
                    ),
              //  const SizedBox(width: 6.0), // Add space between elements

              // Search Field and Right-Side Icons
              Expanded(
                child: searchController.isSearching.value
                    ? Container(
                        margin: EdgeInsets.only(
                            right: 8.0), // Add right margin for spacing
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Background color
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40.0, // Adjust height for the TextField
                                alignment: Alignment
                                    .center, // Align content to the center
                                child: TextField(
                                  controller:
                                      _searchController, // Connect controller
                                  autofocus: true,
                                  textAlignVertical: TextAlignVertical
                                      .center, // Vertically center the text
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        // horizontal: 20.0,
                                        // vertical: 10.0,//
                                        left: 20.0,
                                        top: 10.0,
                                        bottom:
                                            10.0), // Adjust padding to ensure vertical centering
                                    suffixIcon: _searchController
                                            .text.isNotEmpty
                                        ? IconButton(
                                            icon: Icon(Icons.close,
                                                color: Colors.grey),
                                            onPressed: () {
                                              _searchController
                                                  .clear(); // Clear text on close icon press
                                            },
                                          )
                                        : null, // Only show close icon if there is text
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (text) {
                                    (context as Element)
                                        .markNeedsBuild(); // Trigger re-render
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Search Icon
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 28.0,
                            ),
                            onPressed: () {
                              searchController.isSearching.value = true;
                            },
                          ),
                          const SizedBox(width: 8.0), // Add space between icons

                          // Notification Icon
                          IconButton(
                            icon: Icon(
                              Iconsax.notification,
                              color: Colors.black,
                              size: 28.0,
                            ),
                            onPressed: notificationIconAction ?? () {},
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
