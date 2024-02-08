import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:dbminear/app/screen/detailpage/utilies%20/bgcolour.dart';
import 'package:dbminear/app/screen/homepage/model/model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    QuoteModel quoteModel =
        ModalRoute.of(context)?.settings.arguments as QuoteModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Best Quotes & Status",
        ),
      ),
      body: ListView.builder(
        itemCount: quoteModel.quotes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'subdetai',
                  arguments: quoteModel.quotes[index]);
            },
            child: Container(
              alignment: Alignment.bottomRight,
              height: 300,
              width: double.infinity,
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 350,
                color: bgcolour.backgroundcolour[index],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 30),
                    Text("${quoteModel.quotes[index]['quote']}"),
                    Row(
                      children: [
                        const SizedBox(
                          width: 180,
                        ),
                        Text("${quoteModel.quotes[index]['author']}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _shareQuote(quoteModel.quotes[index]['quote']);
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "lib/app/asset/share .png",
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "lib/app/asset/wallpaper.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _shareQuote(String quoteText) async {
    try {
      await FlutterShare.share(
        title: 'Share Quote',
        text: quoteText,
        chooserTitle: 'Share via', // Optional, Android only
      );
    } catch (e) {
      print('Error sharing: $e');
    }
  }
}
