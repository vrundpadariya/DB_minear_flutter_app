import 'package:dbminear/app/database/db_helper.dart';
import 'package:dbminear/app/screen/detailpage/utilies%20/bgcolour.dart';
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
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 350,
                        color: bgcolour.backgroundcolour[index],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 30),
                            Text("${snapshot.data!.qoute[index].qoutes}"),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 180,
                                ),
                                Text("${snapshot.data!.qoute[index].authore}"),
                              ],
                            ),
                            Row(),
                          ],
                        ),
                      );
                    });
              }
              return const CircularProgressIndicator();
            }));
  }
}
