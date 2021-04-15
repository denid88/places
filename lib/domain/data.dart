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

  void addToWishes(Sight sight) {
     _data = _data.map((s) => s.name == sight.name ?
        s.copyWith(isFavorite: true) : s).toList();
      notifyListeners();
  }

  void addToVisited(Sight sight) {
    _data = _data.map((s) => s.name == sight.name ?
      s.copyWith(isVisited: true) : s).toList();
      notifyListeners();
  }

  removeFromListWishes(String name) {
    _data = _data.map((s) => s.name == name ?
      s.copyWith(isFavorite: false) : s).toList();
    notifyListeners();
  }

  removeFromListVisited(String name) {
    _data = _data.map((s) => s.name == name ?
      s.copyWith(isVisited: false) : s).toList();
    notifyListeners();
  }
}
