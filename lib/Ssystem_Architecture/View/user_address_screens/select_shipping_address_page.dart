import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/View/user_address_screens/add_shipping_address_form.dart';

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
          // "Add Address" button with custom styling, full width, and increased height
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 60.0, // Increased height
              child: OutlinedButton.icon(
                onPressed: () {
                  // Action for adding address
                  Get.to(AddShippingAddressForm());
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
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0), // Adjust padding as needed
                ),
              ),
            ),
          ),
          // Location icon and "Save your shipping address here" text
          SizedBox(height: 20.0), // Space between button and icon/text
          Column(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40.0, // Adjust icon size as needed
              ),
              SizedBox(height: 8.0), // Space between icon and text
              Text(
                'Save your shipping address here',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          // Divider(thickness: 2.0), // Divider to separate sections
          // Other content
        ],
      ),
    );
  }
}
