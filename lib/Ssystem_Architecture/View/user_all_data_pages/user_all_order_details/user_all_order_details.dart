import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/create_order_pass_controller.dart';

class UserOrderDetailsPage extends StatelessWidget {
  final CreateOrderPassController orderController =
      Get.put(CreateOrderPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: Colors.teal, // Custom AppBar color
      ),
      body: Obx(() {
        if (orderController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (orderController.orderList.isEmpty) {
          return Center(child: Text('No orders found.'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: orderController.orderList.length,
            itemBuilder: (context, index) {
              final order = orderController.orderList[index];
              final orderVariation = order.lineItems;

              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order #${order.id}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            order.status?.value ?? '',
                            style: TextStyle(
                              color: order.status == 'completed'
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orderVariation!.length,
                        itemBuilder: (context, prodIndex) {
                          var product = orderVariation[prodIndex];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.teal,
                                  size: 32,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name?.value ?? "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Quantity: ${product.quantity}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Variation: ${product.variationId ?? 'N/A'}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order Total:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${order.grandTotal}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
