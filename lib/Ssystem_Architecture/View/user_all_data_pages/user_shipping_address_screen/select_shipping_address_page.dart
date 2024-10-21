import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/user_address_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_shipping_address_screen/add_shipping_address_form.dart';

class SelectShippingAddressPage extends StatelessWidget {
  final UserAddressController userAddressController =
      Get.put(UserAddressController());

  SelectShippingAddressPage({Key? key}) : super(key: key) {
    // Fetch addresses when the page is initialized
    userAddressController.fetchCustomerDetailsControlleer();
  }

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
          // "Add Address" button
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 60.0,
              child: OutlinedButton(
                onPressed: () {
                  // Action for adding address
                  Get.to(AddShippingAddressForm());
                },
                child: Text(
                  'Add Address',
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
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (userAddressController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              // Check if shipping address exists
              if (userAddressController.customer.value.shipping.value == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50.0,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'No shipping address found.',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Please add your shipping address.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              // Get the shipping address
              final shipping =
                  userAddressController.customer.value.shipping.value!;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30.0,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${shipping.firstName}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                '${shipping.address ?? ''}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                '${shipping.phone ?? ''}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
