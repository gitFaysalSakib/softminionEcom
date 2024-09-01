import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigate to settings page
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(
                      'assets/images/p.jpg'), // Replace with user's image
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon:
                          Icon(Icons.camera_alt, color: Colors.black, size: 15),
                      onPressed: () {
                        // Handle image change
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.0), // Space between image and user details
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name', // Replace with user's name
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                        height: 8.0), // Space between user name and subtexts
                    Row(
                      children: [
                        Text('1 Wishlist',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16.0),
                        Text('1 Followed Store',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16.0),
                        Text('1 Vouchers',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
