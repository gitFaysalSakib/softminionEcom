import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/user_address_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/customer_sign_up_and_address_model.dart';
import 'package:softminion/widgets/custom_floating_text_field.dart';

class AddShippingAddressForm extends StatelessWidget {
  // TextEditingControllers for each field in the Shipping model
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AddShippingAddressForm({Key? key}) : super(key: key) {
    // Fetch address on widget initialization
    _initializeData();
  }

  Future<void> _initializeData() async {
    await userAddressController.fetchCustomerDetailsControlleer();
    if (userAddressController.customer.value != null &&
        userAddressController.customer.value.shipping != null) {
      final shipping = userAddressController.customer.value.shipping;

      // Explicitly cast or use toString() for null safety
      firstNameController.text =
          (userAddressController.customer.value.firstName ?? "").toString();
      address1Controller.text = (shipping.value?.address ?? '').toString();
      phoneController.text = (shipping.value?.phone ?? '').toString();
    }
  }

  // TextEditingControllers for Billing fields
  final TextEditingController billingFirstNameController =
      TextEditingController();
  final TextEditingController billingAddressController =
      TextEditingController();
  final TextEditingController billingPhoneController = TextEditingController();

  final UserAddressController userAddressController =
      Get.put(UserAddressController());
  // State to manage the checkbox
  final RxBool isBillingSameAsShipping = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Shipping Address',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (userAddressController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Check if customer data is available
        if (userAddressController.customer.value.shipping == null) {
          // Handle case where there is no shipping data
          return Center(child: Text("No customer shipping data found."));
        }

        // The rest of your widget code
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: FocusScope(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      CustomFloatingTextField(
                        controller: firstNameController,
                        labelText: 'First Name *',
                        hintText: 'Enter first name',
                        textLevel: Colors.red,
                      ),
                      SizedBox(height: 16.0),
                      CustomFloatingTextField(
                        controller: address1Controller,
                        labelText: 'Address *',
                        hintText: 'Enter address line',
                        textLevel: Colors.red,
                      ),
                      SizedBox(height: 16.0),
                      CustomFloatingTextField(
                        controller: phoneController,
                        labelText: 'Phone Number *',
                        hintText: 'Enter phone number',
                        textLevel: Colors.red,
                      ),
                      SizedBox(height: 16.0),

                      // Checkbox for billing address
                      Obx(() {
                        return CheckboxListTile(
                          title: Text(
                              "Billing address is the same as shipping address"),
                          value: isBillingSameAsShipping.value,
                          onChanged: (bool? value) {
                            isBillingSameAsShipping.value = value ?? false;

                            if (isBillingSameAsShipping.value) {
                              // Autofill billing fields if checkbox is checked
                              billingFirstNameController.text =
                                  firstNameController.text;
                              billingAddressController.text =
                                  address1Controller.text;
                              billingPhoneController.text =
                                  phoneController.text;
                            } else {
                              // Clear billing fields if checkbox is unchecked
                              billingFirstNameController.clear();
                              billingAddressController.clear();
                              billingPhoneController.clear();
                            }
                          },
                        );
                      }),

                      // Billing fields
                      CustomFloatingTextField(
                        controller: billingFirstNameController,
                        labelText: 'Billing First Name *',
                        hintText: 'Enter billing first name',
                        textLevel: Colors.red,
                      ),
                      SizedBox(height: 16.0),
                      CustomFloatingTextField(
                        controller: billingAddressController,
                        labelText: 'Billing Address *',
                        hintText: 'Enter billing address line',
                        textLevel: Colors.red,
                      ),
                      SizedBox(height: 16.0),
                      CustomFloatingTextField(
                        controller: billingPhoneController,
                        labelText: 'Billing Phone Number *',
                        hintText: 'Enter billing phone number',
                        textLevel: Colors.red,
                      ),

                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Shipping updatedShipping = Shipping(
                        firstName: firstNameController.text,
                        address: address1Controller.text,
                        phone: phoneController.text,
                      );
                      Billing updateBilling = Billing(
                        firstName: billingFirstNameController.text,
                        address: billingAddressController.text,
                        phone: billingPhoneController.text,
                      );
                      //  Call the update method in the controller
                      userAddressController.updateCustomerDetails(
                          updatedShipping, updateBilling);

                      //Get.toNamed('/select-shipping-address');
                    },
                    child: Text('Submit Address'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
