import 'package:flutter/material.dart';

class PaymentOptionWidget extends StatelessWidget {
  final String title;
  final String shippingAddress; // New parameter for shipping address
  final VoidCallback onSelect; // Callback for selecting the payment method

  const PaymentOptionWidget({
    required this.title,
    required this.shippingAddress,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect, // Trigger onSelect when tapped
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100, // Consistent background color
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.grey.shade300, // Border color
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          // Use Column to stack title and address
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87, // Default text color
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios, // Arrow icon to indicate action
                  color: Colors.grey.shade600,
                  size: 20.0,
                ),
              ],
            ),
            SizedBox(height: 8.0), // Space between title and address
            Text(
              shippingAddress, // Display shipping address
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54, // Lighter color for the address
              ),
            ),
          ],
        ),
      ),
    );
  }
}
