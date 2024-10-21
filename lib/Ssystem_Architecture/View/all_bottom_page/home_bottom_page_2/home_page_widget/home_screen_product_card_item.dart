import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/widgets/custom_image_view.dart';

class ProductcardItemWidget extends StatelessWidget {
  ProductcardItemWidget(
    this.homeProductModel, {
    Key? key,
    this.isGrid = false,
  }) : super(key: key);

  final AllProductsListModel homeProductModel;
  final bool
      isGrid; // Add a parameter to control whether it's in a grid or a list

  String getFirstTwoWords(String text) {
    List<String> words = text.split(' ');
    if (words.isEmpty) return ''; // Return empty if there are no words
    // Capitalize first word and make others lowercase
    String firstWord = words[0].substring(0, 1).toUpperCase() +
        words[0].substring(1).toLowerCase();
    String secondWord = words.length > 1 ? words[1].toLowerCase() : '';
    return '$firstWord $secondWord';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isGrid ? 120.w : double.maxFinite,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image and Status
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: isGrid ? 100.h : 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey.shade300, width: 1.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(
                        () => CustomImageView(
                          imagePath: homeProductModel.images.isNotEmpty &&
                                  homeProductModel
                                      .images[0].imageLink.value.isNotEmpty
                              ? homeProductModel.images[0].imageLink.value
                              : 'assets/images/1n1.png',
                          height: isGrid ? 100.h : 200.h,
                          width: double.maxFinite,
                          radius: BorderRadius.circular(6.0),
                          isNetwork: homeProductModel.images.isNotEmpty,
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        left: 8.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Obx(
                            () => Text(
                              homeProductModel.status.value,
                              style: TextStyle(
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        left: 8.0,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Obx(
                () => Text(
                  getFirstTwoWords(homeProductModel.name.value),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Obx(
                    () => Text(
                      '\$${homeProductModel.price.value.toString()}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade600,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        "Added to Cart",
                        "${homeProductModel.name.value} has been added to your cart.",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 2),
                      );
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.black,
                      size: 22.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
