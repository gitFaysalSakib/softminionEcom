import 'package:flutter/material.dart';
import 'package:softminion/Ssystem_Architecture/Model/add%20to%20cart/cart_item_model.dart';
import 'package:softminion/widgets/add_subtotal_test.dart';

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
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 1',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Red',
      size: 'M',
      price: 99.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 2',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Blue',
      size: 'L',
      price: 79.99,
      quantity: 1, // Ensure quantity is initialized
    ),
    CartItem(
      title: 'Product 3',
      imageUrl: 'assets/images/aaa.jpg',
      color: 'Green',
      size: 'S',
      price: 59.99,
      quantity: 1, // Ensure quantity is initialized
    ),
  ];

  void _deleteSelectedItems() {
    setState(() {
      cartItems.removeWhere((item) => item.isSelected);
    });
  }

  void _toggleSelection(CartItem item, bool? isSelected) {
    setState(() {
      item.isSelected = isSelected ?? false;
    });
  }

  void _changeQuantity(CartItem item, int quantity) {
    setState(() {
      item.quantity = quantity;
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
        title: Text(
          'My Cart',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteSelectedItems,
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
    );
  }
}
