import 'package:flutter/material.dart';

class AppBarLeadingImage extends StatelessWidget {
  final String imagePath;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;

  const AppBarLeadingImage({
    Key? key,
    required this.imagePath,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Image.asset(
          imagePath,
          height: 24, // Use adaptSize if you have a custom extension for responsive sizing
          width: 24,  // Use adaptSize if you have a custom extension for responsive sizing
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
