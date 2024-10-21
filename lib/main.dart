import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/binding/all_binding_controller.dart';
import 'package:softminion/Core/utils/sizer.dart';
import 'package:softminion/Ssystem_Architecture/View/All%20Product%20View%20Page/all_product_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/connect_all_bottom_page/all_bottom_screen_add.dart';
import 'package:softminion/Ssystem_Architecture/View/all_bottom_page/home_bottom_page/demo_product_card_details.dart';
import 'package:softminion/Ssystem_Architecture/View/login/login_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_all_order_details/user_all_order_details.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_profile_screen/user_first_profile_page.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_shipping_address_screen/select_shipping_address_page.dart';

import 'package:softminion/card_all/add_to_cart_item_view_build.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Add const here

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Soft Minion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => Sizer(
                builder: (context, orientation, deviceType) =>
                    AllBottomScreenAdd())), // Use Sizer here
        GetPage(name: '/login', page: () => LoginScreen()), // Login Screen

        GetPage(name: '/user-profile', page: () => UserFirstProfilePage()),
        GetPage(
          name: '/cart_list',
          page: () => CartView(),
        ),
        GetPage(
          name: '/select-shipping-address',
          page: () => SelectShippingAddressPage(),
        ),

        GetPage(
          name: '/user_order_details',
          page: () => UserOrderDetailsPage(),
        ),

        GetPage(
          name: '/grid_view_product',
          page: () => AllProductScreen(),
        ),

        GetPage(
          name: '/product_details',
          page: () {
            final productId = Get.arguments['productId'];

            final isSingleProductView = Get.arguments['isSingleProductView'] ??
                true; // Default to true if not provided
            final showORnotShowWidgets =
                Get.arguments['showORnotShowWidgets'] ??
                    false; // Default to false if not provided
            return DEMOProductcardItemWidget(
              productId: productId,
              isSingleProductView: isSingleProductView,
              showORnotShowWidgets: showORnotShowWidgets,
            );
          },
        ),
      ],
    );
  }
}
