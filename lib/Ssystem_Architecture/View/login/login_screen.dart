import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_login_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/sign_up/signup_screen.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/widgets/custom_floating_text_field.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _usernameilTextField(),
            SizedBox(height: 10.0),
            _passwordTextField(),
            SizedBox(height: 20.0),
            _loginButton(),
            SizedBox(height: 20.0),
            _buildSignUpText(),
            Obx(() {
              return Text(
                loginController.loginError.value,
                style: const TextStyle(color: Colors.red),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _usernameilTextField() {
    return CustomFloatingTextField(
      labelText: "username",
      hintText: "Enter your username",
      prefixIcon: const Icon(Icons.man),
      onChanged: (value) {
        loginController.username.value = value;
      },
    );
  }

  Widget _passwordTextField() {
    return CustomFloatingTextField(
      labelText: "Password",
      hintText: "Enter your password",
      prefixIcon: const Icon(Icons.lock),
      obscureText: true,
      onChanged: (value) {
        loginController.password.value = value;
      },
    );
  }

  Widget _loginButton() {
    return Obx(() {
      return loginController.isLoading.value
          ? const CircularProgressIndicator()
          : CustomButton(
              text: "LOGIN",
              onPressed: () {
                loginController.login();
              },
            );
    });
  }

  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () {
            Get.to(SignupScreen()); // Navigate to the signup screen
          },
          child: const Text("Sign Up"),
        ),
      ],
    );
  }
}
