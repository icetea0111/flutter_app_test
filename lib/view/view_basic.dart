import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:app_test/provider/basic_provider.dart';
import 'package:app_test/model/model_basic.dart';

class BasicView extends StatefulWidget {
  const BasicView({Key? key}) : super(key: key);

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  late List<Basic> basicList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic List"),
      ),
      body: Consumer<BasicProvider>(
        builder: (context, provider, child) {
          basicList = provider.getBasicList();
          return ListView.builder(
            itemCount: basicList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${basicList[index].data.reserveDt}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}