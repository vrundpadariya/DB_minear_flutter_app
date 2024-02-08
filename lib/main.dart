import 'package:dbminear/app/screen/detailpage/views/detailscreen.dart';
import 'package:dbminear/app/screen/homepage/views/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (ctx) => SplashScreen(),
        '/': (ctx) => Home(),
        'detail': (ctx) => DetailScreen(),
        //'subdetai': (ctx) => subdetail(),
      },
    ),
  );
}
