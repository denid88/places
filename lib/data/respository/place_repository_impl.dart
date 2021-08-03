import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/utils/api_client.dart';
import 'package:places/domain/repository/place_repository.dart';
import 'package:http/http.dart' as http;

class PlaceRepositoryImpl implements PlaceRepository {
  final ApiClient apiClient;

  const PlaceRepositoryImpl({required this.apiClient});

  static String placeUrl = 'filtered_places';

  @override
  Future<Place> createPlace() async {
    // TODO: implement createPlace
    throw UnimplementedError();
  }

  @override
  Future<List<Place>> getPlaces(double radius, String category) async {
    print('radius');
    print(radius);
    final Response response = await apiClient.dio.post(
      placeUrl,
      data: jsonEncode({
        "lat": 48.8478039,
        "lng": 37.5525647,
        "radius": 10000.0,
        "typeFilter": [
          "парк",
          "водоем",
          "храм"
        ],
        "nameFilter": ""

      })
    );
    print(response.data);
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
}