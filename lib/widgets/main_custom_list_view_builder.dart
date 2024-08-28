// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class CustomProductListViewNew<T> extends StatelessWidget {
//   // Accept a list of items and a builder function for the item widget
//   final List<T> items;
//   final Widget Function(BuildContext, T) itemBuilder;
//   final double height;
//   final Axis scrollDirection;

//   CustomProductListViewNew({
//     required this.items,
//     required this.itemBuilder,
//     this.height = 266.0,
//     this.scrollDirection = Axis.horizontal,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       width: double.infinity,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 0),
//         child: AnimationLimiter(
//           child: ListView.separated(
//             scrollDirection: scrollDirection,
//             physics: BouncingScrollPhysics(),
//             separatorBuilder: (context, index) => SizedBox(width: 16.0),
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               T model = items[index];
//               return AnimationConfiguration.staggeredList(
//                 position: index,
//                 duration: const Duration(milliseconds: 700),
//                 child: SlideAnimation(
//                   verticalOffset: 50.0,
//                   child: FadeInAnimation(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8.0),
//                       child: itemBuilder(context, model),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//// new code...

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomProductListViewNew<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final double height;
  final Axis scrollDirection;
  final void Function(T) onItemTap; // Add this callback

  CustomProductListViewNew({
    required this.items,
    required this.itemBuilder,
    this.height = 266.0,
    this.scrollDirection = Axis.horizontal,
    required this.onItemTap, // Initialize callback
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: AnimationLimiter(
          child: ListView.separated(
            scrollDirection: scrollDirection,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(width: 16.0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              T model = items[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 700),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () => onItemTap(model), // Call the callback
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
