import 'package:dbminear/app/screen/homepage/model/model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteModel quoteModel =
        ModalRoute.of(context)?.settings.arguments as QuoteModel;
    return Scaffold(
      body: ListView.builder(
        itemCount: quoteModel.quotes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${quoteModel.quotes[index]['quote']}"),
          );
        },
      ),
    );
  }
}
