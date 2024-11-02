import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_attributes_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_variation_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/Token_Manage/token_check_auth_middleware.dart';
import 'package:softminion/Token_Manage/token_store.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';
import 'package:softminion/service_controller/product_details_bottom_sheet_logic/add_to_cart_button_logic.dart';
import 'package:softminion/service_controller/product_details_bottom_sheet_logic/attributes_change_update_price.dart';
import 'package:softminion/service_controller/product_details_bottom_sheet_logic/fetch_pro_price_set_attributes_logic.dart';
import 'package:softminion/widgets/attributes_bottom_sheet/first_index_value_check_controller.dart';
import 'package:softminion/widgets/attributes_bottom_sheet/selectedOption_Updated.controller.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';

class CustomLargeBottomSheetContentUpdateWithApi extends StatefulWidget {
  final bool showOnlyBuyButton;
  final bool showOnlyAddToCartButton;
  final String? lastClickedButton;
  final int productIndex;

  CustomLargeBottomSheetContentUpdateWithApi({
    this.showOnlyBuyButton = false,
    this.showOnlyAddToCartButton = false,
    this.lastClickedButton = "",
    required this.productIndex,
  });

  @override
  _CustomLargeBottomSheetContentUpdateWithApiState createState() =>
      _CustomLargeBottomSheetContentUpdateWithApiState();
}

class _CustomLargeBottomSheetContentUpdateWithApiState
    extends State<CustomLargeBottomSheetContentUpdateWithApi> {
  final AllProductListController productController = Get.find();
  final ProductVariationController variationController = Get.find();
  final CartController cartController = Get.find();
  final AuthMiddleware authMiddleware = Get.put(AuthMiddleware());
  final TokenService tokenService = Get.find();
  final AddToCartButtonLogic cartAttributes = AddToCartButtonLogic();
  final DefaultVariationFinder fetchPriceAttributs = DefaultVariationFinder();
  final PriceUpdater priceUpdater;
  final SelectedoptionUpdatedController selcectController =
      Get.put(SelectedoptionUpdatedController());

  _CustomLargeBottomSheetContentUpdateWithApiState()
      : priceUpdater = PriceUpdater(
            variationController: Get.find<ProductVariationController>());

  // Track selected options for attributes
  //var selectedOptions = <int>[].obs;

  // To display the updated price
  var currentPrice = "".obs;
  // RxString currentPriceTest = "".obs;
  String currentVariationId = "";

  // Loading state for fetching variations and setting default attributes
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    var product = productController.dataList[widget.productIndex];

    selcectController.selectedOptions.value =
        List.filled(product.attributes.length, -1);

    // Ensure the UI is drawn first, then call the function to find the default variation
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int productid = int.parse(product.id.value);

      await variationController.fetchProductVariations(productid);
      // await fetchPriceAttributs.findAndSetDefaultVariation(
      //   defaultPrice: product.price.value.toString(),
      //   product: product,
      //   selectedOptions: selcectController.selectedOptions,
      // );

      if (variationController.variationList.isEmpty) {
        selcectController.selectedOptions.value =
            List.filled(product.attributes.length, 0);
      } else {
        // Use the new DefaultVariationFinder class to find the default variation
        await fetchPriceAttributs.findAndSetDefaultVariation(
          defaultPrice: product.price.value.toString(),
          product: product,
          selectedOptions: selcectController.selectedOptions,
        );
      }

      // Set current price and update loading state
      setState(() {
        currentPrice.value = product.price.value.toString();

        isLoading = false; // Stop showing the loading indicator
      });
    });
  }

  void checkUserLoginAndRedirect(
    BuildContext context,
    AllProductsListModel product,
  ) async {
    bool isLoggedIn = await tokenService.isLoggedIn();
    // product =
    //     productController.dataList[widget.productIndex]; // Get the product

    if (isLoggedIn) {
      _addToCart(product);
      final secondOptionsIndexValue = product.attributes
          .map((attribute) => attribute.options.length > 1
              ? attribute.options[1]
              : null) // Access second item if it exists
          .where((option) =>
              option !=
              null) // Filter out null values, in case some lists are too short
          .toList();
      print("ddffffffffffffffffffffffffffffffff");
      print(secondOptionsIndexValue);
      if (secondOptionsIndexValue.isEmpty) {
      } else {
        Navigator.pop(context);
      }
    } else {
      Get.snackbar(
        'Login Required',
        'Please log in to proceed.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      await Future.delayed(Duration(seconds: 3));

      // Redirect to login and pass current route + productId
      Get.toNamed('/login', arguments: {
        'redirectTo': '/product_details',
        'productId': product.id.value, // Pass the product id
      });
    }
  }

  // Call the CartService's addToCart method
  void _addToCart(AllProductsListModel product) {
    //  var product = productController.dataList[widget.productIndex];

    // Check if currentPrice is empty and assign the product price if needed
    if (currentPrice.value.isEmpty) {
      currentPrice.value = product.price.value.toString();
    }
    cartAttributes.addToCart(
        product: product,
        selectedOptions: selcectController.selectedOptions,
        currentPrice: currentPrice.value,
        currentVariationId: currentVariationId);

    // Check if the widget is mounted before showing the SnackBar
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to cart successfully!'),
        ),
      );
    }
  }

  void fetchUpdatedPrice() async {
    Map<String, String> result = await priceUpdater.fetchUpdatedPrice(
      productController: productController,
      productIndex: widget.productIndex,
      selectedOptions: selcectController.selectedOptions,
    );

    // Update the state with the new price and variation ID
    setState(() {
      currentPrice.value = result['price'] ?? '';
      currentVariationId = result['variationId'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = productController.dataList[widget.productIndex];

    return Container(
      height: SizeUtils.height * 0.8,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.h),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Price and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h, top: 8.h),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(currentPrice.value,
                            style: TextStyle(
                                fontSize: 18.h,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 24,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),

          // Color Section
          SizedBox(height: 20.h),

          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: product.attributes.length,
                  itemBuilder: (context, attributeIndex) {
                    var attribute = product.attributes[attributeIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          attribute.name.value,
                          style: TextStyle(
                            fontSize: 15.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ), // Space between attribute title and its options
                        Container(
                          height: 100.h,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4.h,
                              mainAxisSpacing: 0.h,
                              childAspectRatio: 2,
                            ),
                            itemCount: attribute.options.length,
                            itemBuilder: (BuildContext context, int index) {
                              var option = attribute.options[index];

                              bool isSelected = selcectController
                                      .selectedOptions[attributeIndex] ==
                                  index;

                              return GestureDetector(
                                onTap: () {
                                  // Update the selected option reactively
                                  selcectController
                                      .selectedOptions[attributeIndex] = index;

                                  // Fetch the updated price based on the new selection
                                  fetchUpdatedPrice();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4.h),
                                  margin: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.blue[100],
                                    borderRadius: BorderRadius.circular(10.h),
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.grey,
                                      width: 1.h,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontSize: 10.h,
                                        fontWeight: FontWeight.normal,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                )),
          ),
          if (widget.lastClickedButton == "")
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () {},
              onAddToCart: () async {
                final product = productController.dataList[widget.productIndex];

                checkUserLoginAndRedirect(context, product);
              },
              showBuyNow: true,
              showAddToCart: true,
            )
          else if (widget.showOnlyBuyButton)
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () => print("Buy now"),
              onAddToCart: () {},
              showBuyNow: true,
              showAddToCart: false,
            )
          else if (widget.showOnlyAddToCartButton)
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () {},
              onAddToCart: () async {
                final product = productController.dataList[widget.productIndex];

                checkUserLoginAndRedirect(context, product);
              },
              showBuyNow: false,
              showAddToCart: true,
            )
        ],
      ),
    );
  }
}

void showCustomLargeBottomSheetWithAPI(
  BuildContext context,
  bool buy,
  bool add,
  String name,
  int productIndex,
) {
  final SelectedoptionUpdatedController selcectController =
      Get.put(SelectedoptionUpdatedController());
  final FirstIndexValueCheckController indexFIrst =
      Get.put(FirstIndexValueCheckController());

  final AllProductListController productController = Get.find();
  // Fetch the first option value from each attribute's options list
  final firstOptionsIndexValue = productController
      .dataList[productIndex].attributes
      .map((attribute) =>
          attribute.options.isNotEmpty ? attribute.options.first : null)
      .where((option) =>
          option !=
          null) // Filter out null values, in case some options lists are empty
      .toList();

  // Fetch the second option value from each attribute's options list, if available
  final secondOptionsIndexValue = productController
      .dataList[productIndex].attributes
      .map((attribute) => attribute.options.length > 1
          ? attribute.options[1]
          : null) // Access second item if it exists
      .where((option) =>
          option !=
          null) // Filter out null values, in case some lists are too short
      .toList();
  //print(secondOptionsIndexValue);
  // Check if variation list is not empty
  if (secondOptionsIndexValue.isEmpty) {
    // print(firstOptionsIndexValue);
    // print(secondOptionsIndexValue);

    // If there are no variations, proceed with adding the product to the cart
    final product = productController.dataList[productIndex];
    selcectController.selectedOptions.value = firstOptionsIndexValue
        .map((value) =>
            int.tryParse(value ?? '0') ??
            0) // Convert each item to an int, defaulting to 0 if parsing fails
        .toList();

    final state = Get.put(_CustomLargeBottomSheetContentUpdateWithApiState());
    state.checkUserLoginAndRedirect(context, product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to cart successfully!'),
        duration: Duration(seconds: 1), // Keep message visible for 3 seconds
      ),
    );
    // Call the method to check login and redirect
  } else {
    // Show the modal bottom sheet if variations exist
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CustomLargeBottomSheetContentUpdateWithApi(
        showOnlyBuyButton: buy,
        showOnlyAddToCartButton: add,
        lastClickedButton: name,
        productIndex: productIndex,
      ),
    );
  }
}
