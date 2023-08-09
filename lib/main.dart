import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/provider/basic_provider.dart';
import 'package:app_test/view/view_basic.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<BasicProvider>(
        create: (context) => BasicProvider(),
        child: const BasicView(),
      )
    );
  }
}