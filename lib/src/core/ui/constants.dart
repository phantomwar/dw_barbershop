import 'package:flutter/material.dart';

sealed class ColorsConstants {
  static const Color brow = Color(0xFFB07B01);
  static const Color grey = Color(0xff999999);
  static const Color greyLight = Color(0xffE6e2e9);
  static const Color red = Color(0xffeb1212);
}

sealed class FontConstants {
  static const String fontFamily = 'Poppins';
}

sealed class ImageConstants {
  static const String logo = 'assets/images/imgLogo.png';
  static const String background = 'assets/images/background_image_chair.jpg';
  static const String avatar = 'assets/images/avatar.png';
}
