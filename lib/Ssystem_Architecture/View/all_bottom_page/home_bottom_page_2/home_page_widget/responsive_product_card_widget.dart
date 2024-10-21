import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_screen_product_card_item.dart';
import 'package:softminion/widgets/List_builder_horizontal/custom_list_view_horizontal_home_page2.dart';

class ResponsiveProductGrid extends StatelessWidget {
  final List<AllProductsListModel> products;

  const ResponsiveProductGrid({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the number of items per row based on the width of the screen
        int itemsPerRow;
        double itemHeight;

        if (constraints.maxWidth < 600) {
          // Mobile layout
          itemsPerRow = 2; // Two items per row
          itemHeight = 200; // Adjust height for mobile
        } else if (constraints.maxWidth < 1200) {
          // Tablet layout
          itemsPerRow = 3; // Three items per row
          itemHeight = 250; // Adjust height for tablet
        } else {
          // Desktop layout
          itemsPerRow = 4; // Four items per row
          itemHeight = 300; // Adjust height for desktop
        }

        return CustomProductListViewTestForFinal<AllProductsListModel>(
          items: products,
          itemBuilder: (context, model) {
            return Container(
              height: itemHeight, // Set the height for each item
              child: ProductcardItemWidget(
                  model), // Your existing product card widget
            );
          },

          ///  height: itemHeight, // Set the height based on responsive layout
          //  scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          onItemTap: (model) {
            // Handle item tap
            final id = model.id.value; // Assuming it's an Rx type
            Get.toNamed('/product_details', arguments: {
              'productId': id,
              'isSingleProductView': true,
              'showORnotShowWidgets': false,
            });
          },
          isEven: true,
        );
      },
    );
  }
}
