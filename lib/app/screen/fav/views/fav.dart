import 'package:dbminear/app/database/db_helper.dart';
import 'package:flutter/material.dart';

class favourite extends StatelessWidget {
  const favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite Qoutes"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: DBHelper.dbHelper.fetchQuote(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                return Text("g");
              }
              return const CircularProgressIndicator();
            }));
  }
}
