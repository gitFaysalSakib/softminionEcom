import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/create_order_pass_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/order_confirm/order_sucessfull_screen.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';
import 'package:softminion/card_all/local_storage_card_data.dart';

class OrderConfirmScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final CreateOrderPassController orderController =
      Get.put(CreateOrderPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white, // Set font color to white
        // Match the theme color
      ),
      body: Obx(() {
        final selectedItems =
            cartController.cartItems.where((item) => item.isSelected).toList();
        if (selectedItems.isEmpty) {
          return Center(
              child: Text('No items in the cart.',
                  style: TextStyle(fontSize: 18.0)));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Order',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedItems.length,
                  itemBuilder: (context, index) {
                    final item = selectedItems[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Icon(Icons.shopping_cart, color: Colors.red),
                        title: Text(item.title,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Quantity: ${item.quantity}',
                            style: TextStyle(color: Colors.grey[700])),
                        trailing: Text('\$${item.total * item.quantity}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${cartController.totalPrice}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final CreateOrderPassController createOrderPassController =
                      Get.put(CreateOrderPassController());
                  await createOrderPassController.createOrder();

                  final LocalStorageServiceCartItem storage =
                      Get.put(LocalStorageServiceCartItem());
                  for (var order in createOrderPassController.orderList) {
                    for (var lineItem in order.lineItems!) {
                      await storage
                          .removeCartItem(lineItem.productId.toString());
                    }
                  }

                  Get.to(
                    OrderSuccessScreen(),
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 500),
                  );
                },
                child: Text('Order Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white, // Set font color to white

                  // Updated from 'primary' to 'backgroundColor'
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
