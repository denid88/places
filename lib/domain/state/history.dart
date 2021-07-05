import 'package:flutter/material.dart';

class History extends ChangeNotifier {

  List<String> _history = [];

  List<String> get history => _history;

  void addHistoryItem(String item) {
    _history.add(item);
    notifyListeners();
  }

  void removeHistoryItem(String item) {
    _history.remove(item);
    notifyListeners();
  }

  void removeAllHistory() {
    _history = [];
    notifyListeners();
  }
}