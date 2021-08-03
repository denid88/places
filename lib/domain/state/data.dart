import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor_impl.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/entities/coords.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/utils/geo_utils.dart';

class Data extends ChangeNotifier {

  final PlaceInteractorImpl placeInteractor;

  Data({required this.placeInteractor});

  List<Place> _data = [];

  List<Place> _favorites = [];

  List<Place> _visited = [];

  List<Place> get data => _data;

  List<Place> get favorites => _favorites;

  List<Place> get visited => _visited;

  void fetchData() {
    final Coords currentGeo = Coords(
      lat: 48.8478039,
      lng: 37.5525647
    );

    final Coords nearCityGeo = Coords(lat: 59.9399139, lng: 29.5342723);
    final double distance = distanceInKmBetweenEarthCoordinates(
        currentGeo.lat, currentGeo.lng, nearCityGeo.lat, nearCityGeo.lng);

    print(distance);

    final data = placeInteractor.getPlaces(distance, '');
    data.then((result) {
      _data = result;
    }).catchError((e) {
      if (e is DioError) {
        throw Exception(e.message);
      }
      throw Exception(e);
    });
    notifyListeners();
  }

  void add(Place sight) {
    _data.add(sight);
    notifyListeners();
  }

  void addToWishes(Place sight) {
     // _data = _data.map((s) => s.name == sight.name ?
     //    s.copyWith(isFavorite: true) : s).toList();
     // _favorites.add(sight);
      notifyListeners();
  }

  void removeFromListWishes(String name) {
    // _data = _data.map((s) => s.name == name ?
    // s.copyWith(isFavorite: false) : s).toList();
    // _favorites.removeWhere((s) => s.name == name);
    notifyListeners();
  }

  void addToVisited(Place sight) {
    // _data = _data.map((s) => s.name == sight.name ?
    //   s.copyWith(isVisited: true) : s).toList();
    // _visited.add(sight);
      notifyListeners();
  }

  void removeFromListVisited(String name) {
    // _data = _data.map((s) => s.name == name ?
    //   s.copyWith(isVisited: false) : s).toList();
    // _visited.removeWhere((s) => s.name == name);
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


