import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.red,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Order Placed Successfully!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to home or wherever you want after order success
                Get.offAllNamed('/'); // Replace '/' with your home route
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
