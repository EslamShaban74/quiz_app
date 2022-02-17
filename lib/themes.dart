import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      //color: Get.isDarkMode? Colors.white:Colors.black,
    ),
  );
}
TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      //color: Get.isDarkMode? Colors.white:Colors.black,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      //color: Get.isDarkMode? Colors.white:Colors.black,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      //color: Get.isDarkMode? Colors.white:Colors.black,
    ),
  );
}


TextStyle get bodyStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      //color: Get.isDarkMode? Colors.white:Colors.black,
    ),
  );
}


TextStyle get body2Style {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      //color: Get.isDarkMode? Colors.grey[200]:Colors.black,
    ),
  );
}