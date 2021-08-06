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

  static String placeUrl = 'filtered_places';
  static String favoritesKey = 'favoritePlaces';

  @override
  Future<Place> createPlace() async {
    // TODO: implement createPlace
    throw UnimplementedError();
  }

  @override
  Future<List<Place>> getPlaces(double radius, String category) async {
    final Response response = await apiClient.dio.post(
      placeUrl,
      data: jsonEncode({
        "lat": 48.8478039,
        "lng": 37.5525647,
        "radius": 1000000000000.0,
        "typeFilter": [
          "парк",
          "водоем",
          "храм"
        ],
        "nameFilter": ""

      })
    );
    print(response);
    return List.of(response.data.map<Place>((p) => Place.fromJson(p)));
  }

  @override
  Future<Place> getPlaceById(int id) async {
    // TODO: implement getPlaceById
    throw UnimplementedError();
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
}