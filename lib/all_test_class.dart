import 'package:flutter/material.dart';

class SelectShippingAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Shipping Address'),
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
          // "Add Address" button with custom styling
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () {
                // Action for adding address
              },
              icon: Icon(Icons.add, color: Colors.black),
              label: Text(
                'Add address',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.red), // Border color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0), // Increased padding
              ),
            ),
          ),
          // Divider(thickness: 2.0), // Divider to separate sections
          // Other content
        ],
      ),
    );
  }
}
