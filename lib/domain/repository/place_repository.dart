import 'package:places/data/model/place.dart';

abstract class PlaceRepository {
  Future<Place> createPlace();
  Future<List<Place>> getPlaces(int radius, String category);
  Future<Place> getPlaceById(int id);
  Future updatePlace(int id);
  Future deletePlace(int id);
}