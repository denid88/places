import 'package:flutter/material.dart';

class OnBoard extends ChangeNotifier {
  bool _enabled = false;

  bool get enabled => _enabled;

  void changeOnBoardState(bool value) {
    _enabled = value;
    notifyListeners();
  }
}