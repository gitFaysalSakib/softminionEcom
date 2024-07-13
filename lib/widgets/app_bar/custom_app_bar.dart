import 'package:flutter/material.dart';
//enum Style{bgShadow, bgFill}
// class CustomAppBar extends StatelessWidget {
//    CustomAppBar({Key ? Key, this.hight,  this.action,this.centerTitle,this.leading,this.leadingWidth,this.tital});

//    final double? hight;
//    //final Style? styleType;
//    final double? leadingWidth;
//    final Widget? leading;
//    final Widget? tital;
//    final bool? centerTitle;
//    final List<Widget>? action;


//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       toolbarHeight: hight?? 44,
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.transparent,
//       leadingWidth: leadingWidth??0,
//       leading: tital,
//       titleSpacing: 0,
//       centerTitle: centerTitle??false,
//       actions: action,
//     );
//   }

   
// }

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.action,
    this.centerTitle,
    this.leading,
    this.leadingWidth,
    this.title,
    this.imagePath,
    this.imageHeight,
    this.imageWidth,
    this.backgroundColor
  }) : super(key: key);

  final double? height;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? action;
  final String? imagePath;
  final double? imageHeight;
  final double? imageWidth;
   final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 44,
      automaticallyImplyLeading: false,
    //  backgroundColor: Colors.red,
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      centerTitle: centerTitle ?? false,
      titleSpacing: 0,
      actions: action,
      flexibleSpace: imagePath != null
          ? Image.asset(
              imagePath!,
              height: imageHeight ?? kToolbarHeight,
              width: imageWidth ?? MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )
          : null,
    );
  }
}
