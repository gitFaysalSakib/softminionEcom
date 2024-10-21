import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';
import 'package:softminion/card_all/add_to_cart_model.dart';

class AddToCartButtonLogic {
  final CartController cartController = Get.find<CartController>();

  void addToCart({
    required AllProductsListModel product,
    required List<int> selectedOptions,
    required String currentPrice,
    required String currentVariationId,
  }) {
    // Create a map for selected attributes
    Map<String, String> selectedAttributes = {};
    Map<String, String> selectedAttributesID = {};

    for (int i = 0; i < product.attributes.length; i++) {
      var attribute = product.attributes[i];
      selectedAttributes[attribute.name.value] =
          attribute.options[selectedOptions[i]];

      selectedAttributesID[attribute.id.value] =
          attribute.options[selectedOptions[i]];
    }
    double parsedPrice;
    try {
      parsedPrice = double.parse(currentPrice);
    } catch (e) {
      parsedPrice = 0.0; // Default to 0 if parsing fails
      print("Error parsing price: $e"); // Log the error for debugging
    }

    // Create an instance of CartItemLocalStorageModel
    CartItemLocalStorageModel cartItem = CartItemLocalStorageModel(
      productID: product.id.value,
      categoryID: product.type[0].id.value,
      categoryName: product.type[0].categoryType.value,
      title: product.name.value,
      imageUrls: product.images.map((img) => img.imageLink.value).toList(),
      total: double.parse(currentPrice),
      isSelected: true,
      quantity: 1,
      selectedAttributes: selectedAttributes,
      selectedAttributesWithID: selectedAttributesID,
      variationID: currentVariationId,
    );

    // Add item to the cart and save it
    cartController.cartItems.add(cartItem);
    cartController.saveCartToLocalStorage();
    cartController.loadCartFromLocalStorage();

    // Log or use the length of cart items after saving
    int cartLength = cartController.cartItems.length;
  }
}
