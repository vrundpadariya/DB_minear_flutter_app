import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'intr');
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/app/assets/Outerspace.gif"),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Text(
                "SOLTECH",
                style: GoogleFonts.roboto(fontSize: 25, letterSpacing: 10),
              )
            ],
          ),
        ));
  }
}
