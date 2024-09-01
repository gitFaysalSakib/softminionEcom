import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Model/add%20to%20cart/cart_item_model.dart';
import 'package:softminion/Ssystem_Architecture/View/user_address_screens/select_shipping_address_page.dart';
import 'package:softminion/widgets/customBottomNavigation_Similler_AddCart_Placeorder_Type_widget.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartItem> products;

  const CheckoutPage({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalAmount = products.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    int totalQuantity = products.fold(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.grey,
            height: 2.0,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // "Add Address" section with proper padding
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add),
                SizedBox(width: 8.0),
                InkWell(
                  onTap: () {
                    Get.to(SelectShippingAddressPage());
                  },
                  child: Text(
                    'Add Address',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 2.0), // Divider to separate sections

          // Product details section with padding, border, and margin
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    margin:
                        EdgeInsets.only(bottom: 16.0), // Margin between items
                    padding: EdgeInsets.all(16.0), // Padding inside each item
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Product Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                product.imageUrl,
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16.0),
                            // Product Title and Price
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Quantity
                            Text(
                              'Qty: ${product.quantity}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Color: ${product.color}, Size: ${product.size}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectAll: false, // In the Checkout page, selectAll is likely false.
        totalAmount: totalAmount,
        totalQuantity: totalQuantity,
        onToggleSelectAll: (bool? value) {}, // No action needed here
        onCheckoutPressed: () {
          // Define your checkout action here, such as confirming the order
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Order Placed Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
