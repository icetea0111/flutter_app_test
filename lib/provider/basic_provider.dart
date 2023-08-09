import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_test/model/model_basic.dart';

class BasicProvider with ChangeNotifier {
  final List<Basic> _basicList = List.empty(growable: true);

  List<Basic> getBasicList() {
    _fetchBasic();
    return _basicList;
  }

  void _fetchBasic() async {
    final String response = await rootBundle.loadString('lib/assets/json/basic.json');
    final basicData = basicFromJson(response) as List;
    final List<Basic> result = jsonDecode(response)
        .map((json) => Basic.fromJson(json))
        .toList();

    _basicList.clear();
    _basicList.addAll(result);
    notifyListeners();
  }
}