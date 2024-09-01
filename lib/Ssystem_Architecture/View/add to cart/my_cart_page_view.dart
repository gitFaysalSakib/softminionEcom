import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/all_bottom_screen_add.dart';
import 'package:softminion/Ssystem_Architecture/View/check_out_page/check_out_page.dart';
import 'package:softminion/all_test_class.dart';
import 'package:softminion/Ssystem_Architecture/Model/add%20to%20cart/cart_item_model.dart';
import 'package:softminion/Ssystem_Architecture/View/add%20to%20cart/add_to_cart_item_design_widget_main.dart';
import 'package:softminion/widgets/customBottomNavigation_Similler_AddCart_Placeorder_Type_widget.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<CartItem> cartItems = [
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1,
    ),
    CartItem(
        title: 'Product 2',
        imageUrl: 'assets/images/aaa.jpg',
        color: 'Blue',
        size: 'L',
        price: 79.99,
        quantity: 1),

    CartItem(
      title: 'Product 2',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Blue',
      size: 'L',
      price: 79.99,
      quantity: 1,
    ),
    CartItem(
      title: 'Product 2',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Blue',
      size: 'L',
      price: 79.99,
      quantity: 1,
    ),
    CartItem(
      title: 'Product 2',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Blue',
      size: 'L',
      price: 79.99,
      quantity: 1,
    ),
    CartItem(
      title: 'Product 2',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Blue',
      size: 'L',
      price: 79.99,
      quantity: 1,
    ),
    CartItem(
      title: 'Product 2',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Blue',
      size: 'L',
      price: 79.99,
      quantity: 1,
    ),
    CartItem(
      title: 'Product 2',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Blue',
      size: 'L',
      price: 79.99,
      quantity: 1,
    ),

    // More items...
  ];

  double _totalAmount = 0.0;
  int _totalQuantity = 0;

  bool _selectAll = false;

  void _toggleSelection(CartItem item, bool? isSelected) {
    setState(() {
      item.isSelected = isSelected ?? false;
      _calculateTotalAmount();
    });
  }

  void _changeQuantity(CartItem item, int quantity) {
    setState(() {
      item.quantity = quantity;
      _calculateTotalAmount();
    });
  }

  void _calculateTotalAmount() {
    _totalAmount = 0.0;
    _totalQuantity = 0;

    for (var item in cartItems) {
      if (item.isSelected) {
        _totalAmount += item.price * item.quantity;
        _totalQuantity += item.quantity;
      }
    }
  }

  void _toggleSelectAll(bool? isSelected) {
    setState(() {
      _selectAll = isSelected ?? false;
      for (var item in cartItems) {
        item.isSelected = _selectAll;
      }
      _calculateTotalAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(cartItems.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          // CustomImageView(imagePath: ImageConstant.deleteCartPage, height: 30.h)
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                cartItems.removeWhere((item) => item.isSelected);
                _calculateTotalAmount();
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: cartItems.map((item) {
              try {
                return CartItemWidget(
                  item: item,
                  onSelected: (isSelected) =>
                      _toggleSelection(item, isSelected),
                  onQuantityChanged: (quantity) =>
                      _changeQuantity(item, quantity),
                );
              } catch (e) {
                print('Error creating CartItemWidget: $e');
                return SizedBox.shrink(); // Return an empty widget on error
              }
            }).toList(),
          ),

          // child: Column(
          //   children: cartItems.map((item) {
          //     return CartItemWidget(
          //       item: item,
          //       onSelected: (isSelected) => _toggleSelection(item, isSelected),
          //       onQuantityChanged: (quantity) =>
          //           _changeQuantity(item, quantity),
          //     );
          //   }).toList(),
          // ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBarForSubtotalSection(
        selectAll: _selectAll,
        amount: _totalAmount,
        totalQuantity: _totalQuantity,
        onToggleSelectAll: _toggleSelectAll,
        onCheckoutPressed: () {
          List<CartItem> selectedItems =
              cartItems.where((item) => item.isSelected).toList();

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
                margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(products: selectedItems),
              ),
            );
          }
        },
      ),

/////////////////////////////////////////////////
//old code.....
      // Container(
      //   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         children: [
      //           Checkbox(
      //             value: _selectAll,
      //             onChanged: _toggleSelectAll,
      //           ),
      //           Text('All'),
      //         ],
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Text(
      //             'Subtotal: \$${_totalAmount.toStringAsFixed(2)}',
      //             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(height: 4.0), // Add some spacing
      //           Text(
      //             'Shipping fee: \$5.00',
      //             style: TextStyle(fontSize: 14.0),
      //           ),
      //         ],
      //       ),
      //       CustomButton(
      //         text: 'Check Out(${_totalQuantity})',
      //         textStyle: TextStyle(fontSize: 12, color: Colors.white),
      //         width: 120.0,
      //         onPressed: () {
      //           List<CartItem> selectedItems =
      //               cartItems.where((item) => item.isSelected).toList();

      //           if (selectedItems.isEmpty) {
      //             // Show a popup message if no items are selected
      //             ScaffoldMessenger.of(context).showSnackBar(
      //               SnackBar(
      //                 content: Text(
      //                   'Please select an item',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //                 backgroundColor: Colors.black,
      //                 behavior: SnackBarBehavior.floating,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                 ),
      //                 margin: EdgeInsets.symmetric(
      //                     horizontal: 50.0, vertical: 10.0),
      //                 duration: Duration(seconds: 2),
      //               ),
      //             );
      //           } else {
      //             // Navigate to CheckoutPage if items are selected
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) =>
      //                     CheckoutPage(products: selectedItems),
      //               ),
      //             );
      //           }
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
