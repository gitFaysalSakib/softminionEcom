import 'package:flutter/material.dart';
import 'package:softminion/Core/utils/size_utils.dart';

class CustomProductListViewTestForFinal<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final double height;
  final Axis scrollDirection;
  final void Function(T) onItemTap;
  final bool isEven;

  CustomProductListViewTestForFinal({
    required this.items,
    required this.itemBuilder,
    this.height = 300.0,
    this.scrollDirection = Axis.horizontal,
    required this.onItemTap,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    //this logic is set ListView horizontal limit 2
    // all product show row by row.
    //one row two product..
    //////////......Start.........////
    // return SizedBox(
    //   height: height, // Set the height for the ListView
    //   child: ListView.builder(
    //     itemCount: (items.length / 2).ceil(), // Calculate number of rows needed
    //     itemBuilder: (context, rowIndex) {
    //       return Row(
    //         mainAxisAlignment:
    //             MainAxisAlignment.start, // Align items in the row
    //         children: [
    //           // Display first item of the row
    //           if (rowIndex * 2 < items.length)
    //             Expanded(
    //               child: GestureDetector(
    //                 onTap: () => onItemTap(items[rowIndex * 2]),
    //                 child: Container(
    //                   width: 120.w, // Width for the product card
    //                   child: itemBuilder(context, items[rowIndex * 2]),
    //                 ),
    //               ),
    //             ),
    //           // Display second item of the row
    //           if (rowIndex * 2 + 1 < items.length)
    //             Expanded(
    //               child: GestureDetector(
    //                 onTap: () => onItemTap(items[rowIndex * 2 + 1]),
    //                 child: Container(
    //                   width: 120.w, // Width for the product card
    //                   child: itemBuilder(context, items[rowIndex * 2 + 1]),
    //                 ),
    //               ),
    //             ),
    //         ],
    //       );
    //     },
    //   ),
    // );
    //////////......End.........////

    if (!isEven) {
      // Show all items in a single row when isEven is false
      return SizedBox(
        height: height, // Single row height
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () => onItemTap(item),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 6.w), // Add horizontal space between items
                child: Container(
                  width: 120.w, // Width for each product card
                  child: itemBuilder(context, item),
                ),
              ),
            );
          },
        ),
      );
    } else {
      // Split items into two rows when isEven is true
      int firstRowCount = items.length ~/ 2;
      List<T> firstRowItems = items.take(firstRowCount).toList();
      List<T> secondRowItems = items.skip(firstRowCount).toList();

      return Column(
        children: [
          // First Row: Display first half of the products
          SizedBox(
            height: height, // Height of the first row
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: firstRowItems.length,
              itemBuilder: (context, index) {
                final item = firstRowItems[index];
                return GestureDetector(
                  onTap: () => onItemTap(item),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            6.w), // Adding horizontal space between items
                    child: Container(
                      width: 120.w, // Width for each product card
                      child: itemBuilder(context, item),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
              height: 16
                  .h), // Increase the space between rows for better separation

          // Second Row: Display second half of the products
          if (secondRowItems.isNotEmpty)
            SizedBox(
              height: height, // Height of the second row
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: secondRowItems.length,
                itemBuilder: (context, index) {
                  final item = secondRowItems[index];
                  return GestureDetector(
                    onTap: () => onItemTap(item),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              8.w), // Adding horizontal space between items
                      child: Container(
                        width: 120.w, // Width for each product card
                        child: itemBuilder(context, item),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      );
    }
  }
}
