import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/user_address_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/customer_sign_up_and_address_model.dart';
import 'package:softminion/Token_Manage/token_store.dart';

class UserAddressController extends GetxController {
  final ApiServiceUserAddress _apiService = ApiServiceUserAddress();
  final TokenService tokenService = Get.find<TokenService>();
  late final int userId;

  var customer =
      CustomerSignUpAndAddressModel().obs; // Observable customer model
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  /// Fetch customer details from API
  Future<void> fetchCustomerDetailsControlleer() async {
    isLoading(true);
    errorMessage('');
    String userIdString = tokenService.userId.value;
    int userIdInt = int.parse(userIdString);

    // Get the user ID

    try {
      // Fetch customer details from the API
      final response = await _apiService.fetchCustomerDetails(userIdInt);

      if (response != null) {
        customer.value = response; // Update customer observable
      } else {
        errorMessage('No customer details found.');
        print(errorMessage.value);
      }
    } catch (error) {
      errorMessage(
          'Error fetching customer details: ${error.toString()}'); // Capture and display error message
      print(errorMessage.value); // Log the error message
    } finally {
      isLoading(false); // Set loading to false
    }
  }

  /// Update customer details
  Future<bool> updateCustomerDetails(
      Shipping updatedShipping, Billing updatedBilling) async {
    isLoading(true);
    errorMessage(''); // Clear any previous error messages

    String userIdString = tokenService.userId.value;
    int userIdInt =
        int.parse(userIdString); // Convert userId from string to int

    try {
      // Update the customer with new shipping and billing details
      CustomerSignUpAndAddressModel updatedCustomer = customer.value.copyWith(
        shipping: updatedShipping,
        billing: updatedBilling,
      );

      // Call the API service to update customer details
      bool isUpdated =
          await _apiService.updateCustomerDetails(userIdInt, updatedCustomer);

      if (isUpdated) {
        print('Customer details updated successfully.');
        return true;
      } else {
        errorMessage('Failed to update customer details.');
        print(errorMessage.value);
        return false;
      }
    } catch (error) {
      errorMessage(
          'Error updating customer details: ${error.toString()}'); // Capture and display error message
      print(errorMessage.value); // Log the error message
      return false;
    } finally {
      isLoading(false); // Set loading to false
    }
  }
}
