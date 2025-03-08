import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildFixedSizeIcon(String asset, [Color? color]) {
  return SizedBox(
    width: 50.0, // Ensuring equal width for all items
    height: 50.0,
    child: Center(
      child: SvgPicture.asset(
        asset,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      ),
    ),
  );
}
