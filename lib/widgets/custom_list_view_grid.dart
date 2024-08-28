import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomProductListViewGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final double height;
  final Axis scrollDirection;
  final void Function(T) onItemTap;

  CustomProductListViewGrid({
    required this.items,
    required this.itemBuilder,
    this.height = 266.0,
    this.scrollDirection = Axis.horizontal,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: AnimationLimiter(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of columns as needed
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.75, // Adjust the aspect ratio as needed
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              T model = items[index];
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 700),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () => onItemTap(model),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: itemBuilder(context, model),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
