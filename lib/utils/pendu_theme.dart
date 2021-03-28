import 'package:flutter/material.dart';

class Pendu{
  static ThemeData get lightTheme{
    return ThemeData(
      primaryColor: Pendu.color('1B3149'),
      accentColor: Pendu.color('5BDB98')
    );
  }

  static Color color (String code){
     String finalColor = '0xFF'+code;
    return Color(int.parse(finalColor));
  }

}