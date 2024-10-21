import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_sign_up_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/login/login_screen.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/widgets/custom_floating_text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignupController signupController = Get.put(SignupController());

  // Controllers for the form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _nameTextField(),
            SizedBox(height: 10.0),
            _usernameTextField(),
            SizedBox(height: 10.0),
            _emailTextField(),
            SizedBox(height: 10.0),
            _passwordTextField(),
            SizedBox(height: 20.0),
            _signUpButton(),
            SizedBox(height: 20.0),
            _buildAlreadyAccountText(),
          ],
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFloatingTextField(
          controller: nameController,
          labelText: "Name",
          hintText: "Enter your name",
          prefixIcon: const Icon(Icons.person),
          onChanged: (value) {
            // Clear error when user starts typing
            signupController.nameError.value = '';
          },
        ),
        Obx(() {
          // Display error if name is invalid
          return signupController.nameError.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    signupController.nameError.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _usernameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFloatingTextField(
          controller: usernameController,
          labelText: "Username",
          hintText: "Enter your username",
          prefixIcon: const Icon(Icons.person),
          onChanged: (value) {
            // Clear error when user starts typing
            signupController.usernameError.value = '';
          },
        ),
        Obx(() {
          // Display error if username is invalid
          return signupController.usernameError.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    signupController.usernameError.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFloatingTextField(
          controller: emailController,
          labelText: "Email",
          hintText: "Enter your email",
          prefixIcon: const Icon(Icons.email),
          onChanged: (value) {
            // Clear error when user starts typing
            signupController.emailError.value = '';
          },
        ),
        Obx(() {
          // Display error if email is invalid
          return signupController.emailError.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    signupController.emailError.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFloatingTextField(
          controller: passwordController,
          labelText: "Password",
          hintText: "Enter your password",
          prefixIcon: const Icon(Icons.lock),
          obscureText: true, // To hide the password input
          onChanged: (value) {
            // Clear error when user starts typing
            signupController.passwordError.value = '';
          },
        ),
        Obx(() {
          // Display error if password is invalid
          return signupController.passwordError.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    signupController.passwordError.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _signUpButton() {
    return Obx(() {
      return signupController.isLoading.value
          ? const CircularProgressIndicator() // Show loader while signing up
          : CustomButton(
              text: "SIGN UP",
              onPressed: () {
                signupController.signUp(
                  emailController.text,
                  nameController.text,
                  usernameController.text,
                  passwordController.text,
                );
              },
            );
    });
  }

  Widget _buildAlreadyAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Get.to(LoginScreen()); // Navigate to the login screen
          },
          child: const Text("Login"),
        ),
      ],
    );
  }
}
