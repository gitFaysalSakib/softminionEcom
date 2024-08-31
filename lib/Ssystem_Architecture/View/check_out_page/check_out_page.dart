import 'package:flutter/material.dart';
import 'package:softminion/Ssystem_Architecture/Model/add%20to%20cart/cart_item_model.dart';
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

          // Product details section with padding
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          product.imageUrl,
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.title),
                        subtitle: Text('Price: \$${product.price}'),
                        trailing: Text('Qty: ${product.quantity}'),
                      ),
                      Divider(), // Divider between product items
                    ],
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
