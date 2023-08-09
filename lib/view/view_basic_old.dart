import 'dart:convert';
import 'package:app_test/model/model_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicView extends StatefulWidget {
  const BasicView({Key? key}) : super(key: key);

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  static Future basicList() async {
    final String response = await rootBundle.loadString('lib/assets/json/basic.json');
    final data = await json.decode(response);
    return data["data"]["timeList"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic View"),
      ),
      body: FutureBuilder(
        future: basicList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext con, int index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "예약시간: ${snapshot.data[index]["timeSlot"]},구매수량: ${snapshot.data[index]["stockCount"]}, 재고현황: ${snapshot.data[index]["stockStatusStr"]}"),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error!",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
    );
  }
}