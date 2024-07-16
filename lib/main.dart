import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/Core/utils/sizer.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/home_bottom_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/sign_up/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoftMinion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return SignupScreen();
        },
      ),
    );
  }
}
