import 'package:dbminear/app/screen/detailpage/views/detailscreen.dart';
import 'package:dbminear/app/screen/fav/views/fav.dart';
import 'package:dbminear/app/screen/homepage/views/homescreen.dart';
import 'package:flutter/material.dart';

import 'app/screen/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const SplashScreen(),
        'home': (ctx) => const Home(),
        'detail': (ctx) => const DetailScreen(),
        'fav': (ctx) => const favourite(),
      },
    ),
  );
}
