import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/View/check_out_page/check_out_page.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';
import 'package:softminion/card_all/add_to_cart_item_widget_screen.dart';
import 'package:softminion/widgets/customBottomNavigation_Similler_AddCart_Placeorder_Type_widget.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text('Your cart is empty.'));
        }

        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final item = cartController.cartItems[index];
            return CartItemWidget(
              item: item,
              onSelected: (isSelected) {
                cartController.updateItemSelection(index, isSelected!);
              },
              onQuantityChanged: (newQuantity) {
                cartController.updateItemQuantity(index, newQuantity);
              },
              onRemove: () {
                cartController.removeItem(index);
              },
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        int totalQuantity = cartController.cartItems
            .where((item) => item.isSelected)
            .fold(0, (sum, item) => sum + item.quantity);
        return CustomBottomNavigationBarForSubtotalSection(
          selectAll: cartController.cartItems.every((item) => item.isSelected),
          amount: cartController.totalPrice,
          totalQuantity: totalQuantity,
          onToggleSelectAll: (isSelected) {
            cartController.toggleSelectAll(isSelected!);
          },
          onCheckoutPressed: () {
            // Filter selected cart items
            var selectedItems = cartController.cartItems
                .where((item) => item.isSelected)
                .toList();
            // cartController.printTotalPrice();
            //  print(selectedItems.length);
            if (selectedItems.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Please select an item',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CheckoutPage(cardItemsCheckout: selectedItems),
                ),
              );

              //Get.to(CheckoutPage(cardItemsCheckout: selectedItems));
            }
          },
        );
      }),
    );
  }
}
