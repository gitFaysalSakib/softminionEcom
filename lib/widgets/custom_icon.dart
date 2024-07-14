import 'package:flutter/material.dart';
import 'package:softminion/Core/utils/size_utils.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final double size;

  const CustomIcon({
    Key? key,
    required this.icon,
    this.isSelected = false,
    this.selectedColor = Colors.red,
    this.unselectedColor = Colors.grey,
    this.size = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isSelected ? selectedColor : unselectedColor,
      size: size,
    );
  }
}
