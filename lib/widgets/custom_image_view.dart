import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius? radius;

  const CustomImageView({
    Key? key,
    required this.imagePath,
    this.height,
    this.radius,
    this.width,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}
