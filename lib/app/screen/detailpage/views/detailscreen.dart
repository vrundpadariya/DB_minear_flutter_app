import 'dart:developer';

import 'package:dbminear/app/database/db_helper.dart';
import 'package:dbminear/app/screen/detailpage/utilies%20/bgcolour.dart';
import 'package:dbminear/app/screen/homepage/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    QuoteModel? quoteModel =
        ModalRoute.of(context)?.settings.arguments as QuoteModel?;
    if (quoteModel == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error: Quote data not found"),
        ),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
          itemCount: quoteModel.quotes.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.bottomRight,
              height: 280,
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
                                  "lib/app/asset/share cake.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Future<int?> res = DBHelper.dbHelper
                                .insertQuote(m_quote: quoteModel.quotes[index]);
                            log('${res}');
                            Navigator.pushReplacementNamed(context, 'fav');
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
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
            );
          },
        ),
      );
    }
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
