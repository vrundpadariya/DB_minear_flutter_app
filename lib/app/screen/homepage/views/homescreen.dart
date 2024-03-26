import 'dart:convert';

import 'package:dbminear/app/screen/homepage/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Best Quotes & Status",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('lib/app/asset/json/qoutes.json'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List decodedData = jsonDecode(snapshot.data!);
            List<QuoteModel> quote =
                decodedData.map((e) => QuoteModel.fromJson(data: e)).toList();
            return ListView.builder(
              itemCount: quote.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'detail',
                            arguments: quote[index]);
                      },
                      child: Container(
                          height: 200,
                          width: 350,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(
                              int.parse(quote[index].color),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    quote[index].category,
                                    style: GoogleFonts.albertSans(fontSize: 25),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset(quote[index].image),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
