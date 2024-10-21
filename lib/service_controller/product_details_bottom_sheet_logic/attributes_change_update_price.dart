import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_variation_controller.dart';

class PriceUpdater {
  final ProductVariationController variationController;

  PriceUpdater({required this.variationController});

  Future<Map<String, String>> fetchUpdatedPrice({
    required AllProductListController productController,
    required int productIndex,
    required List<int> selectedOptions,
  }) async {
    var product = productController.dataList[productIndex];
    Map<String, String> selectedAttributeValues = {};
    Map<String, String> selectedAttributeIds =
        {}; // Store attribute ID and option pair

    // Loop through product attributes and store the selected attribute values and IDs
    for (int i = 0; i < product.attributes.length; i++) {
      String attributeName = product.attributes[i].name.value; // Attribute name
      String attributeId = product.attributes[i].id.value; // Attribute ID
      String selectedOption =
          product.attributes[i].options[selectedOptions[i]]; // Selected option

      selectedAttributeValues[attributeName] = selectedOption;
      selectedAttributeIds[attributeId] =
          selectedOption; // Store the ID and option
    }

    // Get main price of the product
    String mainPrice = product.price.value.toString();
    var variationIdFromWidget = variationController.variationList[productIndex];

    // Fetch the price and variationId from the fetchPriceForVariation method
    Map<String, String> result =
        await variationController.fetchPriceForVariation(
      productId: product.id.value,
      selectedAttributes: selectedAttributeValues,
      mainProductPrice: mainPrice,
      variationId: variationIdFromWidget.id.value.toString(),
    );

    return {
      'price': result['price'] ?? mainPrice, // Default to mainPrice if null
      'variationId': result['variationId'] ?? '',
    };
  }
}
