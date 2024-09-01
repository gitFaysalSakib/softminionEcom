// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/Core/utils/sizer.dart';
// import 'package:softminion/Ssystem_Architecture/Controller/home_page_scren_controller.dart';
// import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/RND%20Page/home_bottom_screen.dart';
// import 'package:softminion/Ssystem_Architecture/View/sign_up/signup_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final homePageScrenController = Get.put(HomePageScrenController());

//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SoftMinion',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//         useMaterial3: true,
//       ),
//       home: Sizer(
//         builder: (context, orientation, deviceType) {
//           return SignupScreen();
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/sizer.dart';
import 'package:softminion/Ssystem_Architecture/View/add%20to%20cart/my_cart_page_view.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/all_bottom_screen_add.dart';
import 'package:softminion/Ssystem_Architecture/View/sign_up/signup_screen.dart';
import 'package:softminion/all_test_class.dart';
import 'package:softminion/Ssystem_Architecture/View/user_address_screens/add_shipping_address_form.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          return UserProfilePage();
        },
      ),
    );
  }
}
