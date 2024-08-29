import 'package:flutter/material.dart';
import 'package:softminion/Ssystem_Architecture/Model/add%20to%20cart/cart_item_model.dart';
import 'package:softminion/widgets/add_subtotal_test.dart';
import 'package:softminion/widgets/custom_button_field.dart'; // Import your custom button widget

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
      title: 'Product 3',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Green',
      size: 'S',
      price: 59.99,
      quantity: 1,
    ),
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

  // void _calculateTotalAmount() {

  //   _totalAmount = cartItems
  //       .where((item) => item.isSelected)
  //       .fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  // }
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('My Cart', style: TextStyle(fontStyle: FontStyle.italic)),
        actions: [
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
              return CartItemWidget(
                item: item,
                onSelected: (isSelected) => _toggleSelection(item, isSelected),
                onQuantityChanged: (quantity) =>
                    _changeQuantity(item, quantity),
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end, // Align to the right
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _selectAll,
                      onChanged: _toggleSelectAll,
                    ),
                    Text('All'),
                  ],
                ),
                Text(
                  'Subtotal: \$${_totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4.0), // Add some spacing
            Text(
              'Shipping fee: \$5.00', // Set your shipping fee amount here
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 10.0), // Add some spacing before the button
            CustomButton(
              text: 'Check Out (${_totalQuantity})',
              width: 150.0,
              onPressed: () {
                // Add your checkout logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
