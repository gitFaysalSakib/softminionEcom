import 'package:flutter/material.dart';
import 'package:softminion/Ssystem_Architecture/Model/add%20to%20cart/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final ValueChanged<bool?> onSelected;
  final ValueChanged<int> onQuantityChanged;

  CartItemWidget({
    required this.item,
    required this.onSelected,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Checkbox
          Checkbox(
            value: item.isSelected,
            onChanged: onSelected,
          ),
          SizedBox(width: 8.0),
          // Unified Container for Image and Details
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0), // Unified padding
              decoration: BoxDecoration(
                color: item.isSelected
                    ? Colors.blue.shade50
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: item.isSelected ? Colors.blue : Colors.grey.shade300,
                  width: item.isSelected ? 2.0 : 1.0,
                ),
              ),
              child: Row(
                children: [
                  // Product Image
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(item.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Color: ${item.color}, Size: ${item.size}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            // Quantity Selector
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: item.quantity > 1
                                      ? () =>
                                          onQuantityChanged(item.quantity - 1)
                                      : null,
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () =>
                                      onQuantityChanged(item.quantity + 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
