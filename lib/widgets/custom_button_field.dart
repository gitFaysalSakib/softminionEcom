import 'package:flutter/material.dart';
import 'package:softminion/Core/utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    this.textStyle,
    this.backgroundColor = const Color.fromARGB(255, 248, 25, 9),
    this.width,
    this.height,
    this.onPressed,
    this.padding,
    this.margin,
    this.borderRadius,
    this.icon,
    // this.alignment = Alignment.center,

    //required this.buttonStyle,
    //required this.buttonTextStyle,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Icon? icon;
  final bool isLoading;
  // final Alignment alignment;

  // final EdgeInsetsGeometry? margin;
  // final ButtonStyle buttonStyle;
  //final TextStyle buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50.0,
      margin: margin ?? EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) icon!,
                  if (icon != null) SizedBox(width: 8.0),
                  Text(text,
                      style: textStyle ??
                          TextStyle(color: Colors.white, fontSize: 16.0)),
                ],
              ),
      ),
    );
  }
}
