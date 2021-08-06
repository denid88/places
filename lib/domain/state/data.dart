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

  void fetchData() async {
    final Coords currentGeo = Coords(
      lat: 48.8478039,
      lng: 37.5525647
    );

    final Coords nearCityGeo = Coords(lat: 59.9399139, lng: 29.5342723);
    final double distance = distanceInKmBetweenEarthCoordinates(
        currentGeo.lat, currentGeo.lng, nearCityGeo.lat, nearCityGeo.lng);
    final favoritePlaces = await placeInteractor.getFavoritePlaces();
    final data = placeInteractor.getPlaces(distance, '');

    data.then((result) {
      if (favoritePlaces != null) {
        _favorites = result.where((p) =>
          favoritePlaces.contains(p.id.toString())).toList();
      }

      _data = favoritePlaces == null ? result : List.of(result.map((p) {
        if (favoritePlaces.contains(p.id.toString())) {
          p.isFavorite = true;
        }
        return p;
      }));

      notifyListeners();
    }).catchError((e) {
      if (e is DioError) {
        throw Exception(e.message);
      }
      throw Exception(e);
    });
  }

  void add(Place sight) {
    _data.add(sight);
    notifyListeners();
  }

  void addToWishes(Place place) {

     try {
       placeInteractor.addToFavorites(place)
         .then((_) {
           _data = List.of(_data.map((p) => p.name == place.name ?
              p.copyWith(isFavorite: true) : p));
           _favorites.add(place);
           notifyListeners();
         })
         .catchError((e) { print('Error in add to favorite $e'); });

     } catch (e) {
        print('Something went wrong in add to favorite $e');
     }
  }

  void removeFromListWishes(String name) {
    _data = _data.map((s) => s.name == name ?
    s.copyWith(isFavorite: false) : s).toList();
    _favorites.removeWhere((s) => s.name == name);
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


