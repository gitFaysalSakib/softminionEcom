// import 'package:flutter/material.dart';
// import 'package:softminion/widgets/custom_button_field.dart';

// class CustomBottomNavigationBarAddCartPlaceOderType extends StatelessWidget {
//   final bool selectAll;
//   final double totalAmount;
//   final int totalQuantity;
//   final VoidCallback onCheckoutPressed;
//   final Function(bool?) onToggleSelectAll;

//   const CustomBottomNavigationBarAddCartPlaceOderType({
//     Key? key,
//     required this.selectAll,
//     required this.totalAmount,
//     required this.totalQuantity,
//     required this.onCheckoutPressed,
//     required this.onToggleSelectAll,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Checkbox(
//                 value: selectAll,
//                 onChanged: onToggleSelectAll,
//               ),
//               Text('All'),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Subtotal: \$${totalAmount.toStringAsFixed(2)}',
//                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4.0), // Add some spacing
//               Text(
//                 'Shipping fee: \$5.00',
//                 style: TextStyle(fontSize: 14.0),
//               ),
//             ],
//           ),
//           CustomButton(
//             text: 'Check Out($totalQuantity)',
//             textStyle: TextStyle(fontSize: 12, color: Colors.white),
//             width: 120.0,
//             onPressed: onCheckoutPressed,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:softminion/widgets/custom_button_field.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final bool selectAll;
  final double totalAmount;
  final int totalQuantity;
  final ValueChanged<bool?> onToggleSelectAll;
  final VoidCallback onCheckoutPressed;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectAll,
    required this.totalAmount,
    required this.totalQuantity,
    required this.onToggleSelectAll,
    required this.onCheckoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: selectAll,
                onChanged: onToggleSelectAll,
              ),
              Text('All'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Subtotal: \$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0), // Add some spacing
              Text(
                'Shipping fee: \$5.00',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          CustomButton(
            text: 'Check Out($totalQuantity)',
            textStyle: TextStyle(fontSize: 12, color: Colors.white),
            width: 120.0,
            onPressed: onCheckoutPressed,
          ),
        ],
      ),
    );
  }
}
