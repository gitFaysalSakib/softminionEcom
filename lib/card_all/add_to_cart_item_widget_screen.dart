import 'package:flutter/material.dart';
import 'package:softminion/card_all/add_to_cart_model.dart';
import 'package:softminion/widgets/custom_image_view.dart'; // Adjust this import to match your file structure

class CartItemWidget extends StatelessWidget {
  final CartItemLocalStorageModel item;
  final ValueChanged<bool?> onSelected;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  CartItemWidget({
    required this.item,
    required this.onSelected,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    //  print(item.imageUrls.length);
    // print(item.price);
    String imageUrl = item.imageUrls.isNotEmpty ? item.imageUrls.first : '';
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
              padding: const EdgeInsets.all(10.0),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: imageUrl.isNotEmpty
                          ? CustomImageView(
                              height: 80.0,
                              width: 80.0,
                              fit: BoxFit.cover,
                              imagePath: imageUrl, // Network URL
                              isNetwork: true, // Indicate it's a network image
                              radius:
                                  BorderRadius.circular(8.0), // Optional radius
                            )
                          : Icon(
                              Icons.image_not_supported,
                              size: 80.0,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: onRemove,
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
                        // Display selected attribute values in a row
                        if (item.selectedAttributes.isNotEmpty)
                          Row(
                            children: item.selectedAttributes.values
                                .map((value) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color:
                                              Colors.red, // Change color here
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                          ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${item.total.toStringAsFixed(2)}',
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
