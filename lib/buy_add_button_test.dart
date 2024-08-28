// import 'package:flutter/material.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/widgets/custom_button_field.dart';

// class BuyandAddtoCartBottomButtonBar extends StatelessWidget {
//   final Function? onBuyNow;
//   final Function? onAddToCart;
//   final bool showBuyNow;
//   final bool showAddToCart;

//   BuyandAddtoCartBottomButtonBar({
//     this.onBuyNow,
//     this.onAddToCart,
//     this.showBuyNow = true,
//     this.showAddToCart = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60.h,
//       width: double.infinity, // Adjusts the height based on screen height
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(0.h), // Adjusts the radius based on screen width
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             spreadRadius:
//                 2.w, // Adjusts the spread radius based on screen width
//             blurRadius: 2.w, // Adjusts the blur radius based on screen width
//             offset: Offset(
//                 0, -4.h), // Adjusts the shadow offset based on screen height
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           if (showBuyNow)
//             Expanded(
//               child: CustomButton(
//                 text: 'Buy Now',
//                 backgroundColor: Colors.orange,
//                 onPressed: () {
//                   if (onBuyNow != null) {
//                     onBuyNow!(); // Call the function only if it's provided
//                   }
//                 },
//               ),
//             ),

//           if (showAddToCart)
//             Expanded(
//               child: CustomButton(
//                 text: 'Add to Cart',
//                 backgroundColor: Colors.red,
//                 onPressed: () {
//                   if (onAddToCart != null) {
//                     onAddToCart!(); // Call the function only if it's provided
//                   }
//                 },
//               ),
//             ),
//           SizedBox(width: 16.w), // Adjusts the spacing based on screen width
//         ],
//       ),
//     );
//   }
// }
