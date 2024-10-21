import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:softminion/card_all/add_to_cart_model.dart';

class LocalStorageServiceCartItem {
  static final LocalStorageServiceCartItem _instance =
      LocalStorageServiceCartItem._internal();

  factory LocalStorageServiceCartItem() {
    return _instance;
  }

  LocalStorageServiceCartItem._internal();

  // Save cart items to local storage
  Future<void> saveCart(List<CartItemLocalStorageModel> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartList =
        cartItems.map((item) => json.encode(item.toMap())).toList();
    await prefs.setStringList('cart', cartList);
  }

  // Add a single item to the cart
  Future<void> addToCart(CartItemLocalStorageModel cartItem) async {
    final cartItems = await getCart();
    cartItems.add(cartItem);
    await saveCart(cartItems);
  }

  // Retrieve cart items from local storage
  Future<List<CartItemLocalStorageModel>> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartList = prefs.getStringList('cart');
    if (cartList == null) return [];

    return cartList
        .map((item) => CartItemLocalStorageModel.fromMap(json.decode(item)))
        .toList();
  }

  // Clear cart from local storage
  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
  }

  // Update an item in the cart
  Future<void> updateCartItem(CartItemLocalStorageModel updatedItem) async {
    final cartItems = await getCart();
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].productID == updatedItem.productID) {
        cartItems[i] = updatedItem; // Update the item
        break;
      }
    }
    await saveCart(cartItems);
  }

  // Remove an item from the cart
  Future<void> removeCartItem(String id) async {
    final cartItems = await getCart();
    cartItems.removeWhere((item) => item.productID == id); // Remove the item
    await saveCart(cartItems);
  }
}
