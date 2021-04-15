import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class Data extends ChangeNotifier {

  List<Sight> _data = mocks;

  List<Sight> get data => _data;

  void add(Sight sight) {
    _data.add(sight);
    notifyListeners();
  }
}