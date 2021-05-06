import 'package:flutter/material.dart';

class OnBoard extends ChangeNotifier {
  bool _enabled = true;

  bool get enabled => _enabled;

  void changeOnBoardState(bool value) {
    _enabled = value;
    notifyListeners();
  }
}