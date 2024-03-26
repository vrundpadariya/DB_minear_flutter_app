import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/pagemodekl.dart';

class Intro extends StatelessWidget {
  final AppIntroController controller = Get.put(AppIntroController());

  final List<PageModel> pages = [
    PageModel(
      image: 'lib/app/asset/intro1.png',
      title: 'Welcome to Qoutes app',
      color: Color(0xffe8f4fc),
      description: 'Start A day with qoutes ',
    ),
    PageModel(
        image: 'lib/app/asset/one2.gif',
        title: 'Explore Features',
        description:
            'Provide clear options for users to either sign up for a new account',
        color: Colors.white),
    PageModel(
      image: 'lib/app/asset/one2.gif',
      title: 'Get Started',
      description: 'Let\'s get started!',
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: pages.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      pages[index].image,
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      pages[index].title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        pages[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Add circles to indicate the current page
            Positioned(
              bottom: 32.0,
              left: 16.0,
              child: Obx(() {
                return Row(
                  children: [
                    for (int i = 0; i < pages.length; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == controller.currentPageIndex.value
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                  ],
                );
              }),
            ),
            // Add a button to move to the next page or get started
            Positioned(
              bottom: 32.0,
              right: 16.0,
              child: Obx(() {
                return controller.currentPageIndex.value == pages.length - 1
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'home');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Get started",
                            style: GoogleFonts.albertSans()
                                .copyWith(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          // Move to the next page when the arrow button is tapped
                          controller.currentPageIndex.value++;
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
