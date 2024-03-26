import 'package:dbminear/app/screen/detailpage/views/detailscreen.dart';
import 'package:dbminear/app/screen/homepage/views/homescreen.dart';
import 'package:flutter/material.dart';

import 'app/screen/intro/intro.dart';
import 'app/screen/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const SplashScreen(),
        'intr': (ctx) => Intro(),
        'home': (ctx) => const Home(),
        'detail': (ctx) => const DetailScreen(),
        //'fav': (ctx) => favourite(),
      },
    ),
  );
}
