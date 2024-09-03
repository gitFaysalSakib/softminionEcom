import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/View/payment_method_screen/select_payment_methods.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_shipping_address_screen/add_shipping_address_category_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_shipping_address_screen/select_shipping_address_page.dart';
import 'package:softminion/all_test_class.dart';
import 'package:softminion/widgets/custom_floating_text_field.dart';

class AddShippingAddressForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController regionCityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final AddressCategoryController controller =
      Get.put(AddressCategoryController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Shipping Address',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.to(SelectShippingAddressPage()),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Name field
                  CustomFloatingTextField(
                    controller: nameController,
                    labelText: 'Recipients Name *',
                    hintText: 'Input the real name',
                    textLevel: Colors.red,
                  ),
                  SizedBox(height: 16.0),

                  // Phone number field
                  CustomFloatingTextField(
                    controller: phoneNumberController,
                    labelText: 'Phone Number *',
                    textLevel: Colors.red,
                    hintText: 'Enter your phone number',
                  ),
                  SizedBox(height: 16.0),

                  // Region/City field
                  CustomFloatingTextField(
                    controller: regionCityController,
                    labelText: 'Region/City/District *',
                    hintText: 'Enter your Region or City or District',
                    textLevel: Colors.red,
                  ),
                  SizedBox(height: 16.0),

                  // Address field
                  CustomFloatingTextField(
                    controller: addressController,
                    labelText: 'Address *',
                    hintText: 'House no./building/street/area',
                    textLevel: Colors.red,
                  ),
                  SizedBox(height: 16.0),

                  // Address Category with Radio Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Address Category *',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                        SizedBox(
                            width:
                                16.0), // Space between text and radio buttons
                        Expanded(
                          child: Obx(
                            () => Row(
                              children: [
                                Radio<String>(
                                  activeColor: Colors.red,
                                  value: 'Home',
                                  groupValue: controller.selectedCategory.value,
                                  onChanged: (value) {
                                    controller.updateCategory(value!);
                                  },
                                ),
                                Text('Home'),
                                SizedBox(width: 16.0),
                                Radio<String>(
                                  activeColor: Colors.red,
                                  value: 'Office',
                                  groupValue: controller.selectedCategory.value,
                                  onChanged: (value) {
                                    controller.updateCategory(value!);
                                  },
                                ),
                                Text('Office'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Outlined Button at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity, // Full width of the screen
              child: OutlinedButton(
                onPressed: () {
                  Get.to(SelectPaymentMethod());
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                  side: BorderSide(color: Colors.red, width: 2.0),
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0), // Increase the height
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
