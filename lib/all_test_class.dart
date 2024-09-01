import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/View/user_address_screens/add_shipping_address_form.dart';

class SelectPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Recommended Methods'),
            SizedBox(height: 16.0),
            _buildPaymentOption(
              imagePath:
                  'assets/images/mastercard.png', // Replace with your image path
              label: 'Credit/Debit Card',
            ),
            SizedBox(height: 32.0),
            _buildSectionTitle('Payment Methods'),
            SizedBox(height: 16.0),
            _buildPaymentOption(
              imagePath:
                  'assets/images/bkash.png', // Replace with your image path
              label: 'Save Bkash Account',
            ),
            SizedBox(height: 16.0),
            _buildPaymentOption(
              imagePath:
                  'assets/images/nagod.png', // Replace with your image path
              label: 'Nagad',
            ),
            SizedBox(height: 16.0),
            _buildPaymentOption(
              imagePath:
                  'assets/images/rocket.png', // Replace with your image path
              label: 'Rocket',
            ),
            SizedBox(height: 16.0),
            _buildPaymentOption(
              imagePath:
                  'assets/images/nagod.png', // Replace with your image path
              label: 'Cash On Delivery',
            ),
            SizedBox(height: 16.0),
            _buildPaymentOption(
              imagePath:
                  'assets/images/nagod.png', // Replace with your image path
              label: 'Installment',
            ),
            // Add more payment options as needed
          ],
        ),
      ),
    );
  }

  // Method to build the AppBar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Select Payment Method'),
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.to(AddShippingAddressForm())),
    );
  }

  // Method to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Method to build individual payment options with image
  Widget _buildPaymentOption({
    required String imagePath,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
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
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 30.0,
            height: 30.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
