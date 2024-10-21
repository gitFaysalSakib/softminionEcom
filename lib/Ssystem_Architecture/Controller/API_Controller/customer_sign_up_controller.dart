import 'dart:convert'; // Import for JSON decoding
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:softminion/API%20Service/api_services/customer_sign_up_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/customer_sign_up_and_address_model.dart';
import 'package:softminion/Ssystem_Architecture/View/login/login_screen.dart'; // Import http for error handling

class SignupController extends GetxController {
  final ApiServiceCustomerSignUpAuth apiService =
      ApiServiceCustomerSignUpAuth();

  // Observable states
  var isLoading = false.obs; // Loading state for API call
  var signUpError = ''.obs; // General error message
  var emailError = ''.obs; // Email field-specific error
  var nameError = ''.obs; // Name field-specific error
  var usernameError = ''.obs; // Username field-specific error
  var passwordError = ''.obs; // Password field-specific error

  // Function to handle signup
  void signUp(
      String email, String name, String username, String password) async {
    // Reset all error messages before validation
    clearErrors();

    // Perform field validation
    validateFields(email, name, username, password);

    // If any errors exist, stop the signup process
    if (emailError.isNotEmpty ||
        nameError.isNotEmpty ||
        usernameError.isNotEmpty ||
        passwordError.isNotEmpty) {
      return; // Return early to avoid API call if validation fails
    }

    isLoading.value = true; // Show loading spinner

    // Create a model instance for the customer
    CustomerSignUpAndAddressModel customer = CustomerSignUpAndAddressModel(
      email: email,
      firstName: name,
      username: username,
      password: password,
    );
    // Call the API service for signup
    try {
      bool success = await apiService.signUp(customer);

      if (success) {
        Get.snackbar(
          'Signup Successful', // Title of the Snackbar
          'You have successfully signed up!', // Message content
          snackPosition: SnackPosition.TOP, // Position of the Snackbar
          backgroundColor: Colors.green, // Background color
          colorText: Colors.white, // Text color
          duration: Duration(
              seconds: 2), // Duration for which the snackbar will be shown
        );
        // Navigate to the login screen on successful signup
        Get.offAll(LoginScreen());
      } else {
        signUpError.value = 'Signup failed. Please try again.';
      }
    } catch (e) {
      // Handle specific field-related errors if API returns field-specific issues
      handleApiError(e);
    } finally {
      isLoading.value = false; // Stop loading spinner
    }
  }

  // Reset all error messages
  void clearErrors() {
    signUpError.value = '';
    emailError.value = '';
    nameError.value = '';
    usernameError.value = '';
    passwordError.value = '';
  }

  // Validate form fields before API call
  void validateFields(
      String email, String name, String username, String password) {
    if (email.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Please enter a valid email address';
    }

    if (name.isEmpty) {
      nameError.value = 'Name cannot be empty';
    }

    if (username.isEmpty) {
      usernameError.value = 'Username cannot be empty';
    }

    if (password.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    }
  }

  // Handle errors returned from API (adjust as per your API response)
  void handleApiError(dynamic e) {
    // Log the error for debugging
    print('Error occurred: $e');

    // Assuming your API returns a JSON response in case of an error
    if (e is http.Response) {
      final responseBody = json.decode(e.body); // JSON decode
      final errorMessage = responseBody['message'] ??
          'An unexpected error occurred. Please try again.';

      // Show the specific error message
      Get.snackbar(
        'Signup Error',
        errorMessage,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );

      // If the error contains specific field errors, set them
      if (responseBody.containsKey('data')) {
        final data = responseBody['data'];
        if (data.containsKey('username')) {
          usernameError.value = data['username'];
        }
        if (data.containsKey('email')) {
          emailError.value = data['email'];
        }
      }
    } else {
      // If the error is general, set a sign-up error
      signUpError.value = 'An unexpected error occurred. Please try again.';
    }
  }
}
