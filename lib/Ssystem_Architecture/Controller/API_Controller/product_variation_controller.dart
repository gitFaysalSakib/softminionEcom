import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/product_variation_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/product_varitation_model.dart';

class ProductVariationController extends GetxController {
  var isLoading = true.obs;
  var variationList = <ProductVariationModel>[].obs;
  final ApiProductVaritation apiService = ApiProductVaritation();
  final int? productId; // Change to nullable

  ProductVariationController([this.productId]); // Make the parameter optional

  @override
  void onInit() {
    if (productId != null) {
      // Only fetch variations if productId is provided
      fetchProductVariations(productId!);
    }
    super.onInit();
  }

  // Fetch product variations
  Future<void> fetchProductVariations(int productId) async {
    try {
      isLoading(true);
      var data = await apiService.fetchData(productId);
      if (data.isNotEmpty) {
        variationList.assignAll(data);

        print(variationList.length);
      } else {
        // print(variationList.length);

        print("No product variations found.");
      }
    } catch (e) {
      print("Error fetching product variations: $e");
    } finally {
      isLoading(false);
    }
  }

  // Find the default variation based on price
  void findDefaultVariationBasedOnPrice({
    required String defaultPrice,
    required List productAttributes,
    required Function(List<int>, String) onSuccess,
  }) async {
    var matchingVariation = variationList.firstWhere(
      (variation) => variation.price.value == defaultPrice,
      orElse: () => ProductVariationModel(),
    );

    if (matchingVariation.id.value.isNotEmpty) {
      List<int> selectedOptions = List.filled(productAttributes.length, 0);

      for (int i = 0; i < productAttributes.length; i++) {
        var productAttribute = productAttributes[i];
        var variationAttribute = matchingVariation.attributes.firstWhere(
          (attr) => attr.name.value == productAttribute.name.value,
        );

        if (variationAttribute != null) {
          int matchedOptionIndex = productAttribute.options.indexWhere(
            (option) => option == variationAttribute.option.value,
          );
          if (matchedOptionIndex != -1) {
            selectedOptions[i] = matchedOptionIndex;
          }
        }
      }

      onSuccess(selectedOptions, defaultPrice); // Callback with results
    } else {
      print("Default variation not found.");
    }
  }

  // Fetch updated price based on selected options
  Future<Map<String, String>> fetchPriceForVariation({
    required String productId,
    required String variationId,
    required Map<String, String> selectedAttributes,
    required String
        mainProductPrice, // Pass the main product price as a parameter
  }) async {
    try {
      // Find the matching variation based on selected attributes
      var matchingVariation = variationList.firstWhere((variation) {
        bool isMatch = true;
        selectedAttributes.forEach((key, value) {
          var attributeMatch = variation.attributes.any(
              (attr) => attr.name.value == key && attr.option.value == value);
          if (!attributeMatch) {
            isMatch = false;
          }
        });
        return isMatch;
      },
          orElse: () =>
              ProductVariationModel()); // Return empty model if no match is found

      // Prepare the result map with both variationId and price
      if (matchingVariation.id.value.isNotEmpty &&
          matchingVariation.price.value.isNotEmpty) {
        print(matchingVariation.id.value);

        return {
          'price': matchingVariation.price.value,
          'variationId': matchingVariation.id.value,
        };
      } else {
        // Return the main product price and an empty variationId if no match
        return {
          'price': mainProductPrice,
          'variationId': '', // No variation found
        };
      }
    } catch (e) {
      print("Error fetching price: $e");
      return {
        'price': 'Error',
        'variationId': 'Error',
      };
    }
  }
}
