import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loteria_mexicana/Views/Dashboard.dart';
import 'package:loteria_mexicana/Views/Baraja.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
  ));

  
  
  runApp(MaterialApp(
    routes: {
      '/dash' : (context) => Dashboard(),
      '/baraja' : (context) => Baraja(),
    },
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.grey[100],
      accentColor: Color(0XFF8BAD95),
      selectedRowColor: Color(0XFF403F3A),
      textSelectionColor: Colors.white,
      textSelectionHandleColor: Color(0XFF403F3A),
      appBarTheme: AppBarTheme(
        color: Color(0XFF3D90B7),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.grey[800],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    title: 'Movies APP',
    home: Dashboard()
  ));
}
