import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/API%20Service/shopesmama_api.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Core/utils/sizer.dart';
import 'package:softminion/Ssystem_Architecture/Controller/shopes_mama/shopes_mama_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/add%20to%20cart/my_cart_page_view.dart';
import 'package:softminion/Ssystem_Architecture/View/login/login_screen.dart';
import 'package:softminion/widgets/app_bar/custom_app_bar.dart';
import 'package:softminion/widgets/custom_button_field.dart';
import 'package:softminion/widgets/custom_floating_text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  CustomFloatingText customFloatingText = CustomFloatingText();

  GlobalKey<FormState> _fromState = GlobalKey<FormState>();

  // @override
  TextEditingController nameController = TextEditingController();
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
                            SizedBox(height: 58.h),
                            _nameTextFieldWidget(context),
                            SizedBox(height: 20.h),
                            _emailTextFieldWidget(context),
                            SizedBox(height: 20.h),
                            _passwordTextFieldWidget(context),
                            SizedBox(height: 20.h),
                            _buildAllReadyAccountText(context),
                            SizedBox(height: 20.h),
                            _signUpButton(context),
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

  Widget _buildAllReadyAccountText(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Already have an account?",
          )
        ],
      ),
    );
  }

  Widget _nameTextFieldWidget(BuildContext context) {
    return CustomFloatingTextField(
      controller: nameController,
      labelText: "Name",
      labelStyle: customFloatingText.labelStyle,
      hintText: "Name",
      hintStyle: customFloatingText.hintStyle,
      prefixIcon: Icon(Icons.person),
    );
  }

  Widget _emailTextFieldWidget(BuildContext context) {
    return CustomFloatingTextField(
      controller: editingController,
      labelText: "Email",
      labelStyle: customFloatingText.labelStyle,
      hintText: "Email",
      hintStyle: customFloatingText.hintStyle,
      prefixIcon: Icon(Icons.email),
    );
  }

  Widget _passwordTextFieldWidget(BuildContext context) {
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
            },
          ),
        ),
        SizedBox(height: 30.h),
        Padding(
            padding: EdgeInsets.only(
                left:
                    6.w), // Ensure 'w' is defined in your responsive extension
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ))
      ],
    ),
  );
}

final ApiService apiService = ApiService();
final DataController dataController = Get.put(DataController());

Widget _signUpButton(BuildContext context) {
  return CustomButton(
    isLoading: false,
    text: "SIGN UP",
    onPressed: () {
      dataController; // Just call the function here
    },
  );
}
