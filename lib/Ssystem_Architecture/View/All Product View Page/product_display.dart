import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_screen_product_card_item.dart';
import 'package:softminion/widgets/Grid_builder/custom_grid_builder.dart';

// Create the SaleTitleWithProductView class
class ProductDisplay extends StatefulWidget {
  @override
  _ProductDisplayState createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  final AllProductListController allProductadataController = Get.find();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!allProductadataController.isLoadingMore.value) {
        allProductadataController.fetchDataFromApiServicePageSetDynamically(
            loadMore: true);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10.h, right: 6.h),
      child: Obx(() {
        if (allProductadataController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (allProductadataController.dataList.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomProductGridView<AllProductsListModel>(
                  items: allProductadataController.dataList,
                  crossAxisCount: 3, // Show 3 products per row
                  aspectRatio: 0.65,
                  itemBuilder: (context, product, isGrid) =>
                      ProductcardItemWidget(
                    product,
                    isGrid: isGrid, // Pass isGrid value here
                  ),
                  isGrid: true,
                  onItemTap: (homeProductModel) {
                    final id = homeProductModel.id.value;
                    Get.toNamed('/product_details', arguments: {
                      'productId': id,
                      'isSingleProductView': true,
                      'showORnotShowWidgets': false,
                    });
                  },
                  scrollController:
                      _scrollController, // Use the scroll controller here
                ),
              ),
              if (allProductadataController.isLoadingMore.value)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        } else {
          return Center(child: Text('No products.'));
        }
      }),
    );
  }
}
