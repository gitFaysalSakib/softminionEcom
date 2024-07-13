// import 'dart:ui';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// const num DESIGN_WIDTH = 375;
// const num DESIGN_HEIGHT = 812;
// const num DESIGN_STATUS_BAR = 0;

// extension ResponsiveExtention on num{
//   double  get _width => SizeUtils.width;
//   double get _height => SizeUtils.height;
//   double get h=>((this*_width)/DESIGN_WIDTH);
//   double get v=>(this * _height)/(DESIGN_STATUS_BAR);
//   double get adapSize{
//     var height = v;
//     var width = h;
//     return height < width ? height.toDoubleValue():width.toDoubleValue();
//   }
//   double get fSize => adapSize;


  
// }

// extension FormatExtension on double{

//   double toDoubleValue ({int fractionDifits = 2}){
    
//     return double.parse(this.toStringAsFixed(fractionDifits));
//   }
//   double isNonZero({num defaultValue = 0.0}){
//     return this > 0? this: defaultValue.toDouble();
//   }


// }
// enum DeviceType {
//   mobile,
//   desktop,
//   web,
//   unknown,
// }

// typedef ResponsiveWidgetBuilder = Widget Function(
//     BuildContext context, Orientation orientation, DeviceType deviceType);

// class Sizer extends StatelessWidget {
//   const Sizer({Key? key ,required this.builder}): super(key: key);

//   final ResponsiveWidgetBuilder builder;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context,consctraints){
//       return OrientationBuilder(builder: (context, orientation){
//         SizeUtils.setScreenSize(consctraints, orientation);
//         return builder(context, orientation, SizeUtils.deviceType);
//       });
//     });
//   }
// }


//  class SizeUtils{
//   static late BoxConstraints boxConstraints;
//     static late Orientation orientation;
//       static late DeviceType deviceType;
//         static late double height;
//           static late double width;
          

//           static void setScreenSize(
//             BoxConstraints consctraints,
//             Orientation currentOrintation,

//           ){
//             boxConstraints = consctraints;
//             orientation = currentOrintation;
//             if(orientation == Orientation.portrait){
//               width = boxConstraints.maxWidth;
//               height = boxConstraints.maxHeight;
//             }else{
//                width = boxConstraints.maxHeight;
//       height = boxConstraints.maxWidth;
//             }
//             deviceType = DeviceType.mobile;
//           }

//           static double getResponsiveWidth(double value) {
//     return value * (width / DESIGN_WIDTH);
//   }

//   static double getResponsiveHeight(double value) {
//     return value * (height / DESIGN_HEIGHT);
//   }





//  }


//new customized code....

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
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
    static late double width;

  static late double height;

  static void setScreenSize(BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }

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


