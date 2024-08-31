import 'package:flutter/material.dart';

class AddShippingAddressForm extends StatelessWidget {
  const AddShippingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Shipping Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Content goes here...',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
