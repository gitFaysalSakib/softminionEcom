import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_login_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_profile_screen/user_profile_information_view_edit.dart';
import 'package:softminion/card_all/local_storage_card_data.dart';

class ProfileSettingContentView extends StatelessWidget {
  final LoginController loginController = Get.find();
  final LocalStorageServiceCartItem storage =
      Get.put(LocalStorageServiceCartItem());
  void logProcess() {
    storage.clearCart();
    loginController.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Profile Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile Information'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(ProfileInformation());
              // Navigate to profile information page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to address page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Account Security'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to account security page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to help page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to messages page
            },
          ),
          ElevatedButton(
              onPressed: () {
                logProcess();
              },
              child: Text("out"))
        ],
      ),
    );
  }
}
