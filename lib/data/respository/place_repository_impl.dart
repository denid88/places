import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/utils/api_client.dart';
import 'package:places/domain/repository/place_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final ApiClient apiClient;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  PlaceRepositoryImpl({required this.apiClient});

  static String placesUrl = 'filtered_places';
  static String placeUrl = 'place';

  static String favoritesKey = 'favoritePlaces';
  static String visitingKey = 'visitingPlaces';

  @override
  Future<Place> createPlace(Place place) async {
    final Response response = await apiClient.dio.post(
      placeUrl,
      data: place.toJson()
    );
    print(response);
    return Place.fromJson(response.data);
  }

  @override
  Future<List<Place>> getPlaces(double radius, String category) async {
    final Response response = await apiClient.dio.post(
      placesUrl,
      data: jsonEncode({
        "lat": 48.8478039,
        "lng": 37.5525647,
        "radius": 1000000000000.0,
        "typeFilter": [
          "temple",
          "monument",
          "park",
          "theatre",
          "museum",
          "hotel",
          "restaurant",
          "cafe",
          "other"
        ],
        "nameFilter": ""
      })
    );
    return List.of(response.data.map<Place>((p) => Place.fromJson(p)));
  }

  @override
  Future<Place> getPlaceById(int id) async {
    final Response response = await apiClient.dio.get('$placeUrl/$id');
    return Place.fromJson(response.data);
  }

  @override
  Future deletePlace(int id) {
    // TODO: implement deletePlace
    throw UnimplementedError();
  }

  @override
  Future updatePlace(int id) {
    // TODO: implement updatePlace
    throw UnimplementedError();
  }

  @override
  Future addToFavorites(int id) async {
    final SharedPreferences prefs = await _prefs;
     final favoritePlaces = prefs.getStringList(favoritesKey);
     print('favoritePlaces in repo');
     print(favoritePlaces);
     if (favoritePlaces == null) {
       await prefs.setStringList(favoritesKey, [id.toString()]);
     } else {
       favoritePlaces.add(id.toString());
       final updatedFavoritePlaces = favoritePlaces.toSet().toList();
       await prefs.setStringList(favoritesKey, updatedFavoritePlaces);
     }
  }

  @override
  Future<List<String>?> getFavoritePlaces() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(favoritesKey);
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    final SharedPreferences prefs = await _prefs;
    final favoritePlaces = prefs.getStringList(favoritesKey);
    favoritePlaces!.remove(id.toString());
    await prefs.setStringList(favoritesKey, favoritePlaces);
  }

  @override
  Future<void> addToVisitingPlaces(int id) async {
    final SharedPreferences prefs = await _prefs;
    final visitingPlaces = prefs.getStringList(visitingKey);
    if (visitingPlaces == null) {
      await prefs.setStringList(visitingKey, [id.toString()]);
    } else {
      visitingPlaces.add(id.toString());
      final updatedFavoritePlaces = visitingPlaces.toSet().toList();
      await prefs.setStringList(visitingKey, updatedFavoritePlaces);
    }
  }

  @override
  Future<void> removeFromVisiting(int id) async {
    final SharedPreferences prefs = await _prefs;
    final visitingPlaces = prefs.getStringList(visitingKey);
    visitingPlaces!.remove(id.toString());
    await prefs.setStringList(visitingKey, visitingPlaces);
  }

  @override
  Future<List<String>?> getVisitingPlaces() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(visitingKey);
  }
}