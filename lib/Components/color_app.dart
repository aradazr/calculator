import 'package:flutter/material.dart';

class ColorLightApp{
  static const  backGroundcolor = Color.fromARGB(255, 34, 34, 34);
  static const  numberBttn = Color.fromARGB(255, 83, 83, 83);
  static const  greyBttn = Color.fromARGB(255, 159, 159, 159);
  static const  blueBttn = Color.fromARGB(255, 32, 135, 255);
  static const  numbers = Color.fromARGB(255, 255, 255, 255);
  static const  backNumbers = Color.fromARGB(255, 125, 125, 125);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 34, 34, 34),
    brightness: Brightness.light
  );
}
class ColorDarklApp{
  static const  backGroundcolor = Color.fromARGB(255, 255, 255, 255);
  static const  numberBttn = Color.fromARGB(255, 83, 83, 83);
  static const  greyBttn = Color.fromARGB(255, 159, 159, 159);
  static const  blueBttn = Color.fromARGB(255, 32, 135, 255);
  static const  numbers = Color.fromARGB(255, 255, 255, 255);
  static const  backNumbers = Color.fromARGB(255, 164, 164, 164);
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 34, 34, 34),
    brightness: Brightness.dark
  );
}

class Themes {
  static ThemeData lightTheme = ThemeData(
     
     
     
      brightness: Brightness.light,
      
      scaffoldBackgroundColor: Color.fromARGB(255, 34, 34, 34)
      
      
      
      );

  static ThemeData darkTheme = ThemeData(
     
     
     
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)
      
      
      
      
      );
}