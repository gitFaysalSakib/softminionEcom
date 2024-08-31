import 'package:flutter/material.dart';

class CustomFloatingTextField extends StatelessWidget {
  CustomFloatingTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.hintStyle,
      this.labelText,
      this.labelStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.isDense = true,
      this.obscureText = false,
      this.prefixIconConstraints,
      this.suffixIconConstraints,
      this.autofocus = false,
      this.textInputAction,
      this.fillColor,
      this.contentPadding,
      this.textHint = Colors.black,
      this.textLevel = Colors.black})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDense;
  final bool obscureText;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color textHint;
  final Color textLevel;

  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      autofocus: autofocus,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: textHint),
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyle(color: textLevel),
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        isDense: isDense,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        fillColor: fillColor ?? Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

////////
//new easy code implement and comment old code when needed add or from old code or comment out
class CustomFloatingText extends StatelessWidget {
  CustomFloatingText({
    Key? key,
    this.controller,
    this.alignment,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.red),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.red),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
