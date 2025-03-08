import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:task/core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final bool isReadOnly;
  final Color? colorBorder;
  final TextEditingController controller;
  final String suffixText;
  final Color hintTextColor;
  final BoxShadow boxShadow;
  final double fontSize;
  final double controllerfontSize;
  final double suffixfontSize;
  final Color suffixColor;
  final FontWeight fontWeight;
  final double height;
  final String hintText;
  final double circularRadius;
  final bool isPassword;
  final TextInputType keyBoard;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Function(String v) onChanged;
  final Widget? suffixIcon;
  final int? maxLines;
  final double? withOpacity;
  final Color? color;
  final Color? contentTextColor;
  final bool? expands;

  const CustomTextField({
    super.key,
    this.currentFocusNode,
    this.onTap,
    this.isReadOnly = false,
    this.colorBorder,
    required this.controller,
    this.suffixText = '',
    this.fontSize = 16,
    this.contentTextColor,
    this.hintTextColor = const Color(0xFFD3D3D3),
    this.controllerfontSize = 14,
    required this.onChanged,
    this.suffixfontSize = 14,
    this.suffixColor = Colors.white,
    this.fontWeight = FontWeight.w300,
    this.height = 58,
    this.hintText = "",
    this.circularRadius = 14,
    this.expands = false,
    this.isPassword = false,
    this.keyBoard = TextInputType.text,
    this.boxShadow = const BoxShadow(),
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.withOpacity,
    this.color = const Color(0xFF232327),
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circularRadius),
        border: Border.all(
          color: colorBorder ?? Colors.transparent,
        ),
        boxShadow: [boxShadow],
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(3.0),

      // padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        enabled: true,
        onChanged: (v) {
          onChanged(v);
        },
        cursorColor: AppColors.secondaryPinkColor,
        focusNode: currentFocusNode,
        textAlign: Localizations.localeOf(context).languageCode == 'ar'
            ? TextAlign.right
            : TextAlign.left,
        textDirection: Localizations.localeOf(context).languageCode == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        readOnly: isReadOnly,
        obscureText: isPassword,
        onTap: onTap,
        controller: controller,
        keyboardType: keyBoard,
        maxLines: maxLines,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        style: TextStyle(
          fontSize: controllerfontSize,
          fontWeight: fontWeight,
          color: contentTextColor,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circularRadius),
            borderSide: BorderSide.none,
          ),
          // filled: true,
          // fillColor: BlocProvider.of<ThemeBloc>(context).state.themeMode ==
          //         ThemeMode.light
          //     ? Colors.white
          // : AppColorsDarkMode.lightblackColor,
          prefixIcon: Localizations.localeOf(context).languageCode == 'ar'
              ? suffixIcon
              : prefixIcon,
          suffixIcon: Localizations.localeOf(context).languageCode == 'ar'
              ? prefixIcon
              : suffixIcon,
          suffixText: suffixText,
          suffixStyle: TextStyle(
            fontSize: suffixfontSize,
            fontWeight: fontWeight,
            color: suffixColor,
          ),
          hintStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: hintTextColor,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
