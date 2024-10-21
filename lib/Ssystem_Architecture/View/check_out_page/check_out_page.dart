import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/View/payment_method_screen/select_payment_methods.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_shipping_address_screen/select_shipping_address_page.dart';
import 'package:softminion/Token_Manage/token_check_auth_middleware.dart';
import 'package:softminion/card_all/add_to_cart_model.dart';
import 'package:softminion/widgets/customBottomNavigation_Similler_AddCart_Placeorder_Type_widget.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartItemLocalStorageModel> cardItemsCheckout;

  CheckoutPage({
    Key? key,
    required this.cardItemsCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalAmount = cardItemsCheckout.fold(
      0.0,
      (sum, item) => sum + (item.total * item.quantity),
    );
    int totalQuantity =
        cardItemsCheckout.fold(0, (sum, item) => sum + item.quantity);

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
          SizedBox(height: 20.0), // Added space above the "Add Address" section
          // "Add Address" section with increased padding
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 30.0, horizontal: 16.0), // Increased vertical padding
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
                        color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1.0), // Divider to separate sections

          // Product details section with padding, border, and margin
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: cardItemsCheckout.length,
                itemBuilder: (context, index) {
                  final cartItemController = cardItemsCheckout[index];

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
                              child: Image.network(
                                cartItemController.imageUrls[0],
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
                                    cartItemController.title,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '\$${cartItemController.total.toStringAsFixed(2)}',
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
                              'Qty: ${cartItemController.quantity}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBarForSubtotalSection(
        selectAll: false, // In the Checkout page, selectAll is likely false.
        amount: totalAmount, // Pass the total amount
        totalQuantity: totalQuantity,
        onToggleSelectAll: (bool? value) {}, // No action needed here
        onCheckoutPressed: () {
          Get.to(SelectPaymentMethodPage());
        },
        amountLabel: 'Total', // Change label to "Total"
        buttonText: 'Place Order', // Change button text as needed
      ),
    );
  }
}
