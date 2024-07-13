import 'package:flutter/material.dart';
import 'package:softminion/Core/utils/size_utils.dart';
typedef ResponsiveWidgetBuilder = Widget Function(BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  final ResponsiveWidgetBuilder builder;

  const Sizer({required this.builder, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
          },
        );
      },
    );
  }
}
