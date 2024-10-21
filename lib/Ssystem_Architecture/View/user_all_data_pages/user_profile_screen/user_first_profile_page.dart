import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/customer_login_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_all_order_details/user_all_order_details.dart';
import 'package:softminion/Ssystem_Architecture/View/user_all_data_pages/user_profile_screen/user_info_content_screen.dart';
import 'package:softminion/Token_Manage/token_check_auth_middleware.dart';

class UserFirstProfilePage extends StatefulWidget {
  @override
  _UserFirstProfilePageState createState() => _UserFirstProfilePageState();
}

class _UserFirstProfilePageState extends State<UserFirstProfilePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final loginController = Get.put(LoginController());
  final AuthMiddleware authMiddleware = AuthMiddleware();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

// here authMiddleware directly call in widget...
  void _checkUserLoginAndAddressValue(BuildContext context) async {
    bool isLoggedIn = await authMiddleware.checkUserLoggedIn();
    print(isLoggedIn);
    if (isLoggedIn) {
      var routename = Get.toNamed(Get.currentRoute);
    } else {
      Get.toNamed('/login');
    }
  }

  // Get LoginController

  Future<void> _showImageSourceActionSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Photo'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _imageFile = pickedFile;
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Select from Album'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _imageFile = pickedFile;
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Cancel'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _checkUserLoginAndAddressValue(context);
    // authMiddleware.checkUserLoggedIn();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Iconsax.setting, color: Colors.grey[800]),
            onPressed: () {
              Get.to(ProfileSettingContentView());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: _imageFile != null
                            ? FileImage(File(_imageFile!.path))
                            : AssetImage('assets/images/p.jpg')
                                as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.camera_alt,
                                color: Colors.black, size: 15),
                            onPressed: () {
                              _showImageSourceActionSheet(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              loginController
                                      .tokenService.userName.value.isNotEmpty
                                  ? loginController.tokenService.userName.value
                                  : 'User Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            )),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                                child: Text('1 Wishlist',
                                    style: TextStyle(color: Colors.grey))),
                            SizedBox(width: 8.0),
                            Expanded(
                                child: Text('1 Followed Store',
                                    style: TextStyle(color: Colors.grey))),
                            SizedBox(width: 8.0),
                            Expanded(
                                child: Text('1 Voucher',
                                    style: TextStyle(color: Colors.grey))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              // My Orders section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Orders',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() =>
                          UserOrderDetailsPage()); // Navigate to the orders page
                    },
                    child: Row(
                      children: [
                        Text(
                          'View All Orders',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: 4), // Add space between text and icon
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.blue, // Icon color to match the text
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
