import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';

class CustomProductGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, bool isGrid) itemBuilder;
  final int crossAxisCount;
  final double aspectRatio;
  final void Function(T) onItemTap;
  final bool isGrid;
  final ScrollController? scrollController; // Add scroll controller

  const CustomProductGridView({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 3,
    this.aspectRatio = 0.75,
    required this.onItemTap,
    this.isGrid = true,
    this.scrollController, // Accept scroll controller as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller:
          scrollController, // Use the scroll controller for the grid view
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 20.h,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => onItemTap(item),
          child: itemBuilder(context, item, isGrid),
        );
      },
    );
  }
}
