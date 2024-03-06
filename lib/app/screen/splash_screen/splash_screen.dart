import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/app/asset/Woman reading.gif"),
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Text(
                "Best Quotes and Status",
                style: GoogleFonts.roboto(fontSize: 25, letterSpacing: 5),
              )
            ],
          ),
        ));
  }
}
