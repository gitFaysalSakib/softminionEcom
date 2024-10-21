import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_variation_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/widgets/attributes_bottom_sheet/customLargeBottomSheet_Update_Widget_FromAPi.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';
import 'package:softminion/widgets/custom_image_view.dart';
import 'package:softminion/widgets/custom_search_bar_with_icon_use_appbar.dart';

class DEMOProductcardItemWidget extends StatefulWidget {
  //final AllProductsListModel homeProductModel;
  final String productId; // Accept productId as a required parameter

  final bool isSingleProductView;
  final bool showORnotShowWidgets;
  final bool showProductDetailsPageDeliverySection;
  final bool buyOrAddCartButtonShow;

  DEMOProductcardItemWidget(
      // this.homeProductModel,

      {
    Key? key,
    required this.productId,
    this.isSingleProductView = false,
    this.showORnotShowWidgets = true,
    this.showProductDetailsPageDeliverySection = true,
    this.buyOrAddCartButtonShow = false,
  }) : super(key: key);

  @override
  State<DEMOProductcardItemWidget> createState() =>
      _DEMOProductcardItemWidgetState();
}

class _DEMOProductcardItemWidgetState extends State<DEMOProductcardItemWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final AllProductListController allProductadataController = Get.find();
  AllProductsListModel? _homeProductModel;
  final ProductVariationController variationController =
      Get.put(ProductVariationController());

  int getProductIndex() {
    return allProductadataController.dataList.indexOf(_homeProductModel);
  }

  void _fetchProductById(String productId) {
    // Find the product in the data list by matching the ID
    _homeProductModel = allProductadataController.dataList.firstWhere(
      (product) => product.id == productId,
      // Return null if not found
    );

    // Call setState to update the UI
    setState(() {});
  }

  void _showPopupMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Add to cart successfully!'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchProductById(widget.productId);
    variationController.fetchProductVariations(int.parse(widget.productId));
    // allProductadataController.fetchTEstttttttttttttttttttttttt();
    // if (allProductadataController.dataList.isNotEmpty) {
    //   print(allProductadataController.dataList.length);
    // }
  }

  @override
  Widget build(BuildContext context) {
    // Check the loading state and show a loading indicator

    return widget.isSingleProductView
        ? SafeArea(
            child: Scaffold(
              appBar: CustomAppBarForSearchBarAndCartIcon(),
              body: SingleChildScrollView(
                child: _buildAllContentSeparateFromScaffold(context),
              ),
              bottomNavigationBar: BuyandAddtoCartBottomButtonBar(
                onBuyNow: () {
                  showCustomLargeBottomSheetWithAPI(
                      context, true, false, "1", getProductIndex());
                },
                onAddToCart: () {
                  showCustomLargeBottomSheetWithAPI(
                      context, false, true, "2", getProductIndex());
                },
              ),
            ),
          )
        : SingleChildScrollView(
            child: _buildAllContentSeparateFromScaffold(context),
          );
  }

  Widget _buildAllContentSeparateFromScaffold(BuildContext context) {
    return Obx(() {
      if (variationController.isLoading.value) {
        return Center(
          child: SizedBox(
            height: 50.h, // Adjust size as needed
            width: 50.h,
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Content
          Container(
            height: widget.isSingleProductView ? null : 266.h,
            width: widget.isSingleProductView ? double.infinity : 150.h,
            color: widget.isSingleProductView ? Colors.white : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Container(
                  padding: widget.isSingleProductView
                      ? EdgeInsets.only(
                          top: 0.0,
                        )
                      : EdgeInsets.zero,
                  height: widget.isSingleProductView ? 400.h : 160.h,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(
                        () => ProductImageGalleryORSingleImage(
                          imageUrls: _homeProductModel!.images.isNotEmpty
                              ? _homeProductModel!.images
                                  .map((image) => image.imageLink.value)
                                  .toList()
                              : [
                                  'assets/images/1n1.png'
                                ], // Default image if no images available
                          height: double.infinity,
                          width: double.infinity,
                          radius: BorderRadius.circular(4.h),
                          isNetwork: _homeProductModel!.images
                              .isNotEmpty, // If there are images, assume they are network images
                        ),
                      ),
                    ],
                  ),
                ),
                //  Product Details Section
                Padding(
                  padding: widget.isSingleProductView
                      ? EdgeInsets.only(left: 20.h, top: 10.h)
                      : EdgeInsets.only(top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/money.png',
                            color: Colors.red,
                            height: widget.isSingleProductView ? 12.h : 14.h,
                            width: widget.isSingleProductView ? 25.h : 14.h,
                          ),
                          SizedBox(width: 5.w),
                          Obx(
                            () => Text(
                              _homeProductModel!.price.value
                                  .toString(), // Convert RxInt value to String
                              style: TextStyle(
                                fontSize: widget.isSingleProductView
                                    ? 20.h
                                    : 14.h, // Dynamic font size based on view
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                      if (widget.isSingleProductView == false)
                        Text("ART",
                            style: TextStyle(
                                fontSize:
                                    widget.isSingleProductView ? 15.h : 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      if (widget.isSingleProductView)
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        Text(
                            widget.isSingleProductView
                                ? _homeProductModel!.name.value
                                : "",
                            style: TextStyle(
                                fontSize:
                                    widget.isSingleProductView ? 14.h : 16.h,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      if (widget.isSingleProductView)
                        SizedBox(
                          height: 10.h,
                        ),
                      Text(_homeProductModel!.type[0].categoryType.value,
                          style: TextStyle(
                              fontSize:
                                  widget.isSingleProductView ? 15.h : 10.h,
                              color: widget.isSingleProductView
                                  ? Colors.grey
                                  : Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                if (widget.isSingleProductView)
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.h),
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        color: Colors.grey[100],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildIconWithText(
                              icon: Icons.refresh,
                              text: "7 Days Return",
                            ),
                            SizedBox(height: 20.h),
                            _buildIconWithText(
                              icon: Icons.local_shipping,
                              text: "Free Shipping",
                              subText: "On Orders Over \$50",
                            ),
                            SizedBox(height: 20.h),
                            Obx(() {
                              if (variationController.variationList.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No variations available",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16), // Adjust as needed
                                  ),
                                );
                              }
                              return GestureDetector(
                                onTap: () {
                                  showCustomLargeBottomSheetWithAPI(
                                    context,
                                    true,
                                    true,
                                    "",
                                    getProductIndex(),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.category,
                                        size: 15.h,
                                        color: Colors.grey[
                                            700], // Slightly grey for a professional look
                                      ),
                                      SizedBox(width: 8.w),

                                      // Color variation circles
                                      Row(
                                        children: [
                                          _buildClickableColorCircle(
                                              Colors.red),
                                          SizedBox(width: 4.w),
                                          _buildClickableColorCircle(
                                              Colors.white,
                                              border: Border.all(
                                                  color: Colors.black)),
                                          SizedBox(width: 4.w),
                                          _buildClickableColorCircle(
                                              Colors.blue),
                                          SizedBox(width: 4.w),
                                          _buildClickableColorCircle(
                                              Colors.black),
                                          SizedBox(width: 4.w),
                                          _buildClickableColorCircle(
                                              Colors.yellow),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),

                if (widget.isSingleProductView)
                  SizedBox(
                    height: 20.h,
                  ),
                if (widget.isSingleProductView) _buildTabSection(),
                if (widget.isSingleProductView)
                  SizedBox(
                    height: 20.h,
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildTabSection() {
    return Column(
      children: [
        // Tab Bar
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.red,
          tabs: [
            Tab(text: 'Description'),
            Tab(text: 'Seller'),
            Tab(text: 'Reviews'),
          ],
        ),
        // Tab Bar View
        Container(
          height: 200.h, // Set your desired height
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDescriptionTab(),
              _buildReviewsTab(),
              _buildSpecificationsTab(),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget _buildColorCircle(Color color, {Border? border}) {
//   return Container(
//     width: 20.h,
//     height: 20.h,
//     decoration: BoxDecoration(
//       color: color,
//       shape: BoxShape.circle,
//       border: border,
//     ),
//   );
// }
Widget _buildClickableColorCircle(Color color, {Border? border}) {
  return Container(
    width: 30.h,
    height: 30.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: border ?? Border.all(color: Colors.transparent),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 2), // shadow direction: bottom right
        ),
      ],
    ),
    child: Center(
      child: color == Colors.white
          ? Container(
              width: 15.h,
              height: 15.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
            )
          : null,
    ),
  );
}

Widget _buildIconWithText({
  required IconData icon,
  required String text,
  String? subText,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 20.h,
      ),
      SizedBox(width: 12.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.bold),
          ),
          if (subText != null)
            Text(
              subText,
              style: TextStyle(fontSize: 12.h, color: Colors.grey),
            ),
        ],
      ),
    ],
  );
}

Widget _buildSpecificationsTab() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Here are the specifications of the product.',
      style: TextStyle(fontSize: 14.h),
    ),
  );
}

Widget _buildReviewsTab() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Here are the reviews of the product.',
      style: TextStyle(fontSize: 14.h),
    ),
  );
}

Widget _buildDescriptionTab() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      '\u2022 Budget Friendly Product\n'
      '\u2022 Brand: Tabassum Fashion LTD\n'
      '\u2022 Size: M, L, XL, XXL\n'
      '\u2022 * Size: M-Length 26, Chest 36\n'
      '\u2022 * Size: L-Length 27, Chest 38\n'
      '\u2022 * Size: XL-Length 28, Chest 40\n'
      '\u2022 * Size: XXL-Length 29, Chest 42\n'
      '\u2022 Fabrics: Jersey\n',
      style: TextStyle(fontSize: 14.h),
    ),
  );
}

Widget _buildSearchBar() {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: 16.h), // Padding for the search bar
    child: Container(
      height: 48.0, // Fixed height to make it square-shaped
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        border: Border.all(
          color: Colors.red, // Red border color
          width: 3.0, // Increase the width to make the border bold
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none, // No default border
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          prefixIcon: Icon(Icons.search, color: Colors.grey), // Search icon
        ),
      ),
    ),
  );
}
