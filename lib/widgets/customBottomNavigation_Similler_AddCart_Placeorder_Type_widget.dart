import 'package:flutter/material.dart';
import 'package:softminion/widgets/custom_button_field.dart';

class CustomBottomNavigationBarForSubtotalSection extends StatelessWidget {
  final bool selectAll;
  final double amount;
  final int totalQuantity;
  final ValueChanged<bool?> onToggleSelectAll;
  final VoidCallback onCheckoutPressed;
  final String amountLabel; // Dynamic label for "Subtotal" or "Total"
  final String buttonText; // Dynamic button text

  const CustomBottomNavigationBarForSubtotalSection({
    Key? key,
    required this.selectAll,
    required this.amount,
    required this.totalQuantity,
    required this.onToggleSelectAll,
    required this.onCheckoutPressed,
    this.amountLabel = 'Subtotal', // Default to "Subtotal"
    this.buttonText = 'Check Out', // Default button text
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
                '$amountLabel: \$${amount.toStringAsFixed(2)}',
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
            text: '$buttonText($totalQuantity)',
            textStyle: TextStyle(fontSize: 12, color: Colors.white),
            width: 120.0,
            onPressed: onCheckoutPressed,
          ),
        ],
      ),
    );
  }
}
