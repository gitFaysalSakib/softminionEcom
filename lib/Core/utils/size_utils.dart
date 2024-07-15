// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// const double DESIGN_WIDTH = 375.0;
// const double DESIGN_HEIGHT = 812.0;

// enum DeviceType {
//   mobile,
//   tablet,
//   desktop,
//   web,
//   unknown,
// }

// extension ResponsiveExtension on num {
//   double get w => SizeUtils.getResponsiveWidth(this.toDouble());
//   double get h => SizeUtils.getResponsiveHeight(this.toDouble());
//   double get fSize => SizeUtils.fSize;
// }

// class SizeUtils {
//   static late BoxConstraints boxConstraints;
//   static late Orientation orientation;
//   static late DeviceType deviceType;
//     static late double width;

//   static late double height;

//   static void setScreenSize(BoxConstraints constraints, Orientation currentOrientation) {
//     boxConstraints = constraints;
//     orientation = currentOrientation;

//     if (orientation == Orientation.portrait) {
//       width = boxConstraints.maxWidth;
//       height = boxConstraints.maxHeight;
//     } else {
//       width = boxConstraints.maxHeight;
//       height = boxConstraints.maxWidth;
//     }

//     deviceType = _getDeviceType();
//   }

//   static double getResponsiveWidth(double value) {
//     return value * (width / DESIGN_WIDTH);
//   }

//   static double getResponsiveHeight(double value) {
//     return value * (height / DESIGN_HEIGHT);
//   }

//   static double get adapSize {
//     return height < width ? height : width;
//   }

//   static double get fSize => adapSize;

//   static DeviceType _getDeviceType() {
//     if (kIsWeb) {
//       return DeviceType.web;
//     } else if (defaultTargetPlatform == TargetPlatform.iOS ||
//                defaultTargetPlatform == TargetPlatform.android) {
//       return DeviceType.mobile;
//     } else if (defaultTargetPlatform == TargetPlatform.macOS ||
//                defaultTargetPlatform == TargetPlatform.windows ||
//                defaultTargetPlatform == TargetPlatform.linux) {
//       return DeviceType.desktop;
//     } else {
//       return DeviceType.unknown;
//     }
//   }
// }

//// new code ....
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double DESIGN_WIDTH = 375.0;
const double DESIGN_HEIGHT = 812.0;

enum DeviceType {
  mobile,
  tablet,
  desktop,
  web,
  unknown,
}

extension ResponsiveExtension on num {
  double get w => SizeUtils.getResponsiveWidth(this.toDouble());
  double get h => SizeUtils.getResponsiveHeight(this.toDouble());
  double get fSize => SizeUtils.fSize;
}

class SizeUtils {
  static late double width;
  static late double height;
  static late Orientation orientation;
  static late DeviceType deviceType;

  static void setScreenSize(Size size, Orientation currentOrientation) {
    width = size.width;
    height = size.height;
    orientation = currentOrientation;
    deviceType = _getDeviceType();
  }

  static double getResponsiveWidth(double value) {
    return value * (width / DESIGN_WIDTH);
  }

  static double getResponsiveHeight(double value) {
    return value * (height / DESIGN_HEIGHT);
  }

  static double get adapSize {
    return height < width ? height : width;
  }

  static double get fSize => adapSize;

  static DeviceType _getDeviceType() {
    if (kIsWeb) {
      return DeviceType.web;
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      return DeviceType.mobile;
    } else if (defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux) {
      return DeviceType.desktop;
    } else {
      return DeviceType.unknown;
    }
  }
}
