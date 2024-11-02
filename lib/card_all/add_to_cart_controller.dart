import 'package:get/get.dart';
import 'package:softminion/card_all/local_storage_card_data.dart';
import 'add_to_cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItemLocalStorageModel>[].obs;

  // Get total price of selected items
  // Method to calculate the total value from cart items
  double get totalPrice => cartItems.fold(0,
      (sum, item) => sum + (item.isSelected ? item.total * item.quantity : 0));
  int get cartItemCount => cartItems.length;

  // Load cart data from local storage when initializing the controller
  @override
  void onInit() {
    super.onInit();
    loadCartFromLocalStorage();
  }

  // Update item selection
  void updateItemSelection(int index, bool isSelected) {
    var updatedItem = cartItems[index].copyWith(isSelected: isSelected);
    cartItems[index] = updatedItem;
    saveCartToLocalStorage();
  }

  // Update item quantity
  void updateItemQuantity(int index, int quantity) {
    var updatedItem = cartItems[index].copyWith(quantity: quantity);
    cartItems[index] = updatedItem;
    saveCartToLocalStorage();
  }

  // Save cart to local storage
  void saveCartToLocalStorage() {
    LocalStorageServiceCartItem().saveCart(cartItems);
  }

  // Load cart from local storage
  void loadCartFromLocalStorage() async {
    var savedCart = await LocalStorageServiceCartItem().getCart();
    cartItems.assignAll(savedCart);
    // cartItems.forEach((item) {
    //   print(
    //       'Item: ${item.title}, Quantity: ${item.quantity}, Price: ${item.total}, oid: ${item.productID},id: ${item.categoryID}');
    // });
  }

  // Toggle select all items
  void toggleSelectAll(bool isSelected) {
    for (var item in cartItems) {
      item.isSelected = isSelected;
    }
    cartItems.refresh(); // Refresh the observable list to update the UI
    saveCartToLocalStorage();
  }

  // Remove an item from the cart
  void removeItem(int index) {
    cartItems.removeAt(index);
    saveCartToLocalStorage();
  }
}
