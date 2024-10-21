import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_variation_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';

class DefaultVariationFinder {
  final ProductVariationController variationController =
      Get.find<ProductVariationController>();

  Future<List<int>> findAndSetDefaultVariation({
    required String defaultPrice,
    required AllProductsListModel product,
    required RxList<int> selectedOptions,
  }) async {
    // Loop through the variation list to find the one that matches the price
    for (var variation in variationController.variationList) {
      if (variation.price.value == defaultPrice) {
        for (int i = 0; i < product.attributes.length; i++) {
          var productAttribute = product.attributes[i];

          // Use nullable type and check if the variationAttribute is found
          var variationAttribute = variation.attributes.firstWhereOrNull(
            (attr) => attr.name.value == productAttribute.name.value,
          );

          if (variationAttribute != null) {
            int matchedOptionIndex = productAttribute.options.indexWhere(
              (option) => option == variationAttribute.option.value,
            );

            if (matchedOptionIndex != -1) {
              selectedOptions[i] = matchedOptionIndex; // Update selected option
            }
          }
        }
        break; // Stop searching once the matching variation is found
      }
    }
    return selectedOptions;
  }
}
