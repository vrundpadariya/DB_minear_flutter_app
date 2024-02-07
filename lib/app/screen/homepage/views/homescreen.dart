import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Best qoutes&tatus"),
      ),
      body:  Column(
        children: [
           FutureBuilder(
        future: rootBundle.loadString("bhagwatgeeta.json"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            var decodedData = jsonDecode(snapshot.data!);
            List allData =
                decodedData.map((e) => .fromjson(data: e)).toList();
            return ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'detail',
                        arguments: allData[i]);
                  },
                  title: Text("${allData[i].id}"),
                  subtitle: Text("${allData[i].sanskrit}"),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
        ],
      ),
    );
  }
}
