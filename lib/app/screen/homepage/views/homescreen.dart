import 'dart:convert';

import 'package:dbminear/app/screen/homepage/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Best Quotes & Status",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('lib/app/json/qoutes.json'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List decodedData = jsonDecode(snapshot.data!);
            List<QuoteModel> quote =
                decodedData.map((e) => QuoteModel.fromJson(data: e)).toList();
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: quote.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments: quote[index]);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Column(
                        children: [
                          Text(
                            "${quote[index].category}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
