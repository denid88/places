import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/enums.dart';

class Data extends ChangeNotifier {
  List<Sight> _data = mocks;

  List<Sight> _favorites = [];

  List<Sight> _visited = mocks.where((s) => s.isVisited).toList();

  List<Sight> get data => _data;

  List<Sight> get favorites => _favorites;

  List<Sight> get visited => _visited;

  void add(Sight sight) {
    _data.add(sight);
    notifyListeners();
  }

  void addToWishes(Sight sight) {
     _data = _data.map((s) => s.name == sight.name ?
        s.copyWith(isFavorite: true) : s).toList();
     _favorites.add(sight);
      notifyListeners();
  }

  void removeFromListWishes(String name) {
    _data = _data.map((s) => s.name == name ?
    s.copyWith(isFavorite: false) : s).toList();
    _favorites.removeWhere((s) => s.name == name);
    notifyListeners();
  }

  void addToVisited(Sight sight) {
    _data = _data.map((s) => s.name == sight.name ?
      s.copyWith(isVisited: true) : s).toList();
    _visited.add(sight);
      notifyListeners();
  }


  void removeFromListVisited(String name) {
    _data = _data.map((s) => s.name == name ?
      s.copyWith(isVisited: false) : s).toList();
    _visited.removeWhere((s) => s.name == name);
    notifyListeners();
  }

  void orderSightFavorite(String name, CardDirection direction) {
    final currentIndex = _favorites.indexWhere((element) => element.name == name);
    final currentCard = _favorites[currentIndex];

    if (direction == CardDirection.down) {
      final nextCard = currentIndex < _favorites.length ?
        _favorites[currentIndex + 1] : _favorites[currentIndex];
      _favorites[currentIndex] = nextCard;
      _favorites[currentIndex + 1] = currentCard;
    } else if (direction == CardDirection.up) {
      final prevCard = currentIndex > 0 ?
        _favorites[currentIndex - 1] :  _favorites[currentIndex];

      if (currentIndex > 0) {
        _favorites[currentIndex - 1] = currentCard;
        _favorites[currentIndex] = prevCard;
      }
    }
    notifyListeners();
  }

  void orderSightVisited(String name, CardDirection direction) {
    final currentIndex = _visited.indexWhere((element) => element.name == name);
    final currentCard = _visited[currentIndex];

    if (direction == CardDirection.down) {
      final nextCard = currentIndex < _visited.length ?
      _visited[currentIndex + 1] : _visited[currentIndex];

      _visited[currentIndex] = nextCard;
      _visited[currentIndex + 1] = currentCard;
    } else if (direction == CardDirection.up) {
      final prevCard = currentIndex > 0 ?
      _visited[currentIndex - 1] :  _visited[currentIndex];

      if (currentIndex > 0) {
        _visited[currentIndex - 1] = currentCard;
        _visited[currentIndex] = prevCard;
      }
    }
    notifyListeners();
  }
}


