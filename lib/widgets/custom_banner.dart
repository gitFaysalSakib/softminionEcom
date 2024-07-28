import 'package:flutter/material.dart';

class CustomImageBanner extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? subtitle;
  final double height;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color overlayColor;
  final double overlayOpacity;

  const CustomImageBanner({
    Key? key,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.height = 200.0,
    this.titleStyle,
    this.subtitleStyle,
    this.overlayColor = Colors.black,
    this.overlayOpacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: overlayColor.withOpacity(overlayOpacity),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: titleStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: subtitleStyle ??
                        const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
