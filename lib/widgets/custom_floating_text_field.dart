import 'package:flutter/material.dart';

class CustomFloatingTextField extends StatelessWidget {
  CustomFloatingTextField({
    Key? key,
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
    this.textHint=Colors.black,
    this.textLevel = Colors.black
  }) : super(key: key);

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
        labelStyle: labelStyle ?? TextStyle(color:textLevel),
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
//////
// class CustomFloatingTextField extends StatefulWidget {
//   CustomFloatingTextField(
//       {Key? key,
//       this.alignment,
//       this.width,
//       this.scrollPadding,
//       this.controller,
//       this.focusNode,
//       this.autofocus = false,
//       this.textStyle,
//       this.obscureText = false,
//       this.textInputAction = TextInputAction.next,
//       this.textInputType = TextInputType.text,
//       this.maxLines,
//       this.hintText,
//       this.hintStyle,
//       this.labelText,
//       this.labelStyle,
//       this.prefix,
//       this.prefixConstraints,
//       this.suffix,
//       this.suffixConstraints,
//       this.contentPadding,
//       this.borderDecoration,
//       this.fillColor,
//       this.filled = true,
//       this.validator})
//       : super(
//           key: key,
//         );

//   final Alignment? alignment;
//   final double? width;
//   final EdgeInsets? scrollPadding;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;

//   final bool? autofocus;
//   final TextStyle? textStyle;
//   final bool? obscureText;
//   final TextInputAction? textInputAction;
//   final TextInputType? textInputType;
//   final int? maxLines;
//   final String? hintText;
//   final TextStyle? hintStyle;
//   final String? labelText;
//   final TextStyle? labelStyle;
//   final Widget? prefix;
//   final BoxConstraints? prefixConstraints;
//   final Widget? suffix;
//   final BoxConstraints? suffixConstraints;
//   final EdgeInsets? contentPadding;
//   final InputBorder? borderDecoration;
//   final Color? fillColor;
//   final bool? filled;
//   final FormFieldValidator<String>? validator;

//   @override
//   State<CustomFloatingTextField> createState() =>
//       _CustomFloatingTextFieldState();
// }

// class _CustomFloatingTextFieldState extends State<CustomFloatingTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.alignment != null
//         ? Align(
//             alignment: widget.alignment ?? Alignment.center,
//             child: floatingTextFieldWidget(context))
//         : floatingTextFieldWidget(context);
//   }

//   Widget floatingTextFieldWidget(BuildContext context) => SizedBox(
//         width: widget.width ?? double.maxFinite,
//         child: TextFormField(
//           scrollPadding: widget.scrollPadding ??
//               EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           controller: widget.controller,
//           focusNode: widget.focusNode,
//           // onTapOutside: (event) {
//           //   if (widget.focusNode != null) {
//           //     widget.focusNode?.unfocus();
//           //   } else {
//           //     FocusManager.instance.primaryFocus?.unfocus();
//           //   }
//           // },
//           autofocus: widget.autofocus!,
//           style: widget.textStyle ?? CustomTextStyles.titleSmallGray500,
//           obscureText: widget.obscureText!,
//           textInputAction: widget.textInputAction,
//           keyboardType: widget.textInputType,
//           maxLines: widget.maxLines ?? 1,
//           decoration: decoration,
//           validator: widget.validator,
//         ),
//       );

//   InputDecoration get decoration => InputDecoration(
//         hintText: widget.hintText ?? "",
//         hintStyle: widget.hintStyle ?? theme.textTheme.bodyMedium,
//         labelText: widget.labelText ?? "",
//         labelStyle: widget.labelStyle,
//         prefixIcon: widget.prefix,
//         prefixIconConstraints: widget.prefixConstraints,
//         suffixIcon: widget.suffix,
//         suffixIconConstraints: widget.suffixConstraints,
//         isDense: true,
//         contentPadding: widget.contentPadding ??
//             EdgeInsets.fromLTRB(16.w, 30.h, 16.w, 16.h),
//         fillColor: widget.fillColor ??
//             theme.colorScheme.onPrimary.withOpacity(1),
//         filled: widget.filled,
//         border: widget.borderDecoration ??
//             OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4.h),
//               borderSide: BorderSide.none,
//             ),
//         enabledBorder: widget.borderDecoration ??
//             OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4.h),
//               borderSide: BorderSide.none,
//             ),
//         focusedBorder: widget.borderDecoration ??
//             OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4.h),
//               borderSide: BorderSide.none,
//             ),
//       );
// }


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
        hintText:  hintText,
        hintStyle:  TextStyle(color: Colors.red),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.red),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        
           
      ),
    );
  }
}


