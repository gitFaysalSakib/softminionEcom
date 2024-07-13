import 'package:flutter/material.dart';
import 'package:softminion/Core/import_file_all.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Core/utils/sizer.dart';
import 'package:softminion/Ssystem_Architecture/View/forgot_password/forgot_password_screen.dart';
import 'package:softminion/theme/custom_text_style.dart';
import 'package:softminion/widgets/app_bar/app_bar_leading_image.dart';
import 'package:softminion/widgets/app_bar/custom_app_bar.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/widgets/custom_floating_text_field.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  CustomFloatingText customFloatingText = CustomFloatingText();

  GlobalKey<FormState> _fromState = GlobalKey<FormState>();

  // @override
  TextEditingController editingController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _fromState,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Use MainAxisSize.min
                    children: [
                      _buildNavigationbar(context),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            _emailTextWidget(context),
                            SizedBox(height: 20.h),
                            _passwordTextWidget(context),
                            SizedBox(height: 20.h),
                            _loginButton(context),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _emailTextWidget(BuildContext context) {
    return CustomFloatingTextField(
      controller: editingController,
      labelText: "Email",
      labelStyle: customFloatingText.labelStyle,
      hintText: "Email",
      hintStyle: customFloatingText.hintStyle,
      prefixIcon: Icon(Icons.email),
    );
  }

  Widget _passwordTextWidget(BuildContext context) {
    return CustomFloatingTextField(
      controller: passwordController,
      labelText: "Password",
      labelStyle: customFloatingText.labelStyle,
      hintText: "Password",
      hintStyle: customFloatingText.hintStyle,
      prefixIcon: Icon(Icons.password),
    );
  }
}

Widget _buildNavigationbar(BuildContext context) {
  CustomAppBar customAppBar = CustomAppBar();

  print("app bar");
  return Container(
    width: double.maxFinite,
    margin: EdgeInsets.symmetric(horizontal: 8.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          leadingWidth: 50,
          action: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              // Handle back button press
            },
          ),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.only(
              left: 6.w), // Ensure 'w' is defined in your responsive extension
          child: Text(
            "Login",
            style: Theme.of(context)
                .textTheme
                .displayMedium, // Correct access to the text theme
          ),
        )
      ],
    ),
  );
}

// Widget _loginButton(BuildContext context) {
//   CustomButton customButton = CustomButton(
//     text: '',
//   );

//   return CustomButton(
//     backgroundColor: customButton.backgroundColor,
//     //textStyle: TextStyle(color: Colors.white),
//     borderRadius: BorderRadius.circular(8.0),
//     icon: Icon(Icons.login, color: Colors.white),
//     isLoading: false,
//     text: "LOGIN",
//     onPressed: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
//       );
//     },
//   );
// }
Widget _loginButton(BuildContext context) {
  //  CustomButton customButton = CustomButton(text: "",);

  return CustomButton(
    //textStyle: TextStyle(color: Colors.white),
    // borderRadius: BorderRadius.circular(8.0),
    //icon: Icon(Icons.login, color: Colors.white),
    isLoading: false,
    text: "LOGIN",
    onPressed: () {
      Get.to(() => ForgotPasswordScreen());
    },
  );
}
