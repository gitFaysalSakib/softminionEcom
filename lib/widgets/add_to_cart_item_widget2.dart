// import 'package:flutter/material.dart';
// import 'package:softminion/Ssystem_Architecture/Model/add%20to%20cart/cart_item_model.dart';

// class CartItemWidget extends StatelessWidget {
//   final CartItem item;
//   final ValueChanged<bool?> onSelected;
//   final ValueChanged<int> onQuantityChanged;

//   CartItemWidget({
//     required this.item,
//     required this.onSelected,
//     required this.onQuantityChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: item.isSelected ? Colors.blue.shade50 : Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           border: Border.all(
//             color: item.isSelected ? Colors.blue : Colors.grey.shade300,
//             width: item.isSelected ? 2.0 : 1.0,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade400,
//               offset: Offset(0, 2),
//               blurRadius: 4.0,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             Container(
//               width: double.infinity,
//               height: 120.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
//                 image: DecorationImage(
//                   image: AssetImage(item.imageUrl),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Product Details
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Checkbox and Title
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: item.isSelected,
//                         onChanged: onSelected,
//                       ),
//                       SizedBox(width: 12.0),
//                       Expanded(
//                         child: Text(
//                           item.title,
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 6.0),
//                   Text(
//                     'Color: ${item.color}, Size: ${item.size}',
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       color: Colors.grey[600],
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 10.0),
//                   // Price and Quantity Selector
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '\$${item.price.toStringAsFixed(2)}',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red,
//                         ),
//                       ),
//                       // Quantity Selector
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.remove_circle_outline),
//                             onPressed: item.quantity > 1
//                                 ? () => onQuantityChanged(item.quantity - 1)
//                                 : null,
//                           ),
//                           Text(
//                             '${item.quantity}',
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.add_circle_outline),
//                             onPressed: () =>
//                                 onQuantityChanged(item.quantity + 1),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
