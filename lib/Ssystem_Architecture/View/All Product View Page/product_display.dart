import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_attributes_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Ssystem_Architecture/View/All%20Product%20View%20Page/filter_drawer.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page_2/home_page_widget/home_screen_product_card_item.dart';
import 'package:softminion/widgets/Grid_builder/custom_grid_builder.dart';
import 'package:softminion/widgets/app_bar/custom_app_bar.dart';
import 'package:softminion/widgets/custom_carousol_banner/carousol_banner.dart';

class ProductDisplay extends StatefulWidget {
  @override
  _ProductDisplayState createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  final AllProductListController allProductadataController = Get.find();
  late ScrollController _scrollController;
  final CategoriesController categoriesController =
      Get.put(CategoriesController()); // Initialize controller
  final ProductAttributesController productAttributesController =
      Get.put(ProductAttributesController()); // Initialize controller
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  void _openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget _buildimageView(BuildContext context) {
    return CustomCarouselSlider(
      images: [
        'assets/images/banner1.png',
        'assets/images/banner2.png',
        'assets/images/banner3.png',
        'assets/images/banner4.png',
        'assets/images/banner6.png',
      ],
      height: 150.0,
      autoPlay: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set app bar height
        child: CustomAppBar(
          showBackButton: true,
        ), // Use the custom app bar here
      ),
      resizeToAvoidBottomInset: false,

      endDrawerEnableOpenDragGesture:
          false, // Disables the default end-drawer gesture and icon
      endDrawer: FilterDrawer(
        categoriesController: categoriesController,
        productAttributesController: productAttributesController,
      ),
      body: Builder(
        builder: (context) => Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 10.h, right: 6.h),
          child: Obx(() {
            if (allProductadataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (allProductadataController.dataList.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildimageView(context),
                  // Filter icon row
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Space between elements
                      children: [
                        // Back arrow icon and Text widget aligned to the left
                        Row(
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //     // Check if a category name exists
                            //     if (allProductadataController
                            //             .selectedCategoryaName
                            //             .value
                            //             ?.isNotEmpty ==
                            //         true) {
                            //       // If a category name is found, fetch data
                            //       allProductadataController
                            //           .fetchDataFromApiServicePageSetDynamically();
                            //       allProductadataController
                            //           .selectedCategoryaName.value = "";
                            //     } else {
                            //       // If no category name is found, navigate back
                            //       Get.back();
                            //     }
                            //   },
                            //   child: const Icon(Icons.arrow_back,
                            //       size: 24.0), // Back arrow icon
                            // ),
                            // const SizedBox(
                            //     width: 12), // Spacing between arrow and text
                            Obx(() {
                              return Text(
                                allProductadataController.selectedCategoryaName
                                            .value?.isNotEmpty ==
                                        true
                                    ? allProductadataController
                                        .selectedCategoryaName.value!
                                    : "All", // Show "All" if the category name is null or empty
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                          ],
                        ),

                        // Row for the filter and menu icons aligned to the right
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _openDrawer, // Open the FilterDrawer
                              child: const Icon(Icons.filter_list, size: 28.0),
                            ),
                            const SizedBox(width: 12), // Spacing between icons
                            GestureDetector(
                              onTap: _openDrawer, // Open the FilterDrawer
                              child: const Icon(Icons.menu, size: 28.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

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
                      scrollController: _scrollController,
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
              return const Center(child: Text('No products.'));
            }
          }),
        ),
      ),
    );
  }
}
