import 'dart:convert';
import 'package:dbminear/app/screen/homepage/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
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
                          color: Color(int.parse(quote[index].color)),
                          border: Border.all(color: Colors.black)),
                      child: Text(
                        quote[index].category,
                        style: const TextStyle(color: Colors.black),
                      )),
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
