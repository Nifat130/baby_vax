import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizes.dart';

class CustomAlignText extends StatelessWidget {
  final String text;

  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? decorationThickness;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final Color? decorationColor;

  const CustomAlignText({
    super.key,
    required this.text,

    this.textAlign,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft,child: 
    
      Text(
        text,
        textAlign: textAlign ?? TextAlign.left,
        style: GoogleFonts.poppins(
          decoration: decoration,
          decorationThickness: decorationThickness,
          decorationColor: decorationColor ?? const Color(0xff2972FF),
          fontSize: fontSize ?? getWidth(14),
          color: color ?? AppColors.textSecondary,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}
