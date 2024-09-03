// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

// class ProfileInformation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Information'),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         titleTextStyle: TextStyle(
//           color: Colors.black,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Full Name and Change Password Section
//             _buildSectionRow(
//               titleLeft: 'Full Name',
//               valueRight: 'John Doe',
//               onTap: () {
//                 // Handle Full Name edit
//               },
//             ),
//             Divider(
//               thickness: .09,
//             ),
//             _buildSectionRow(
//               titleLeft: 'Change Password',
//               valueRight: '********',
//               onTap: () {
//                 // Handle Change Password edit
//               },
//             ),
//             SizedBox(height: 16.0),
//             // Change Mobile, Add Email, Gender, Birthday Section
//             _buildSectionRow(
//               titleLeft: 'Change Mobile',
//               valueRight: '+123 456 7890',
//               onTap: () {
//                 // Handle Change Mobile edit
//               },
//             ),
//             Divider(
//               thickness: .09,
//             ),
//             _buildSectionRow(
//               titleLeft: 'Add Email',
//               valueRight: 'john.doe@example.com',
//               onTap: () {
//                 // Handle Add Email edit
//               },
//             ),
//             Divider(
//               thickness: .09,
//             ),
//             _buildSectionRow(
//               titleLeft: 'Gender',
//               valueRight: 'Male',
//               onTap: () {
//                 // Handle Gender edit
//               },
//             ),
//             Divider(
//               thickness: .09,
//             ),
//             _buildSectionRow(
//               titleLeft: 'Birthday',
//               valueRight: '01 Jan 1990',
//               onTap: () {
//                 // Handle Birthday edit
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionRow({
//     required String titleLeft,
//     required String valueRight,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             titleLeft,
//             style: TextStyle(
//               fontSize: 16.0,
//               color: Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 valueRight,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(width: 8.0),
//               IconButton(
//                 icon: Icon(Icons.edit, color: Colors.blue),
//                 onPressed: onTap,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
