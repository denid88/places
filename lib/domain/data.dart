import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class Data extends ChangeNotifier {
  List<Sight> _data = mocks;

  List<Sight> _wishesList = [];

  List<Sight> _visitedList = [];

  List<Sight> get data => _data;

  List<Sight> get wishesList => _wishesList;

  List<Sight> get visitedList => _visitedList;

  void add(Sight sight) {
    _data.add(sight);
    notifyListeners();
  }

  void addToWishes(Sight sight) {
    final duplicate =
      _wishesList.singleWhereOrNull((s) => s.name == sight.name);
    if (duplicate == null) {
      _wishesList.add(sight);
      notifyListeners();
    }
  }

  void addToVisited(Sight sight) {
    final duplicate =
      _visitedList.singleWhereOrNull((s) => s.name == sight.name);
    if (duplicate == null) {
      _visitedList.add(sight);
      notifyListeners();
    }
  }

  removeFromListWishes(String name) {
    _wishesList.removeWhere((s) => s.name == name);
    notifyListeners();
  }

  removeFromListVisited(String name) {
    _visitedList.removeWhere((s) => s.name == name);
    notifyListeners();
  }
}
