import 'package:places/data/model/place.dart';

abstract class PlaceRepository {
  Future<Place> createPlace(Place place);
  Future<List<Place>> getPlaces(double radius, String category);
  Future<Place> getPlaceById(int id);
  Future updatePlace(int id);
  Future deletePlace(int id);
  Future<void> addToFavorites(int id);
  Future<void> removeFromFavorites(int id);
  Future<List<String>?> getFavoritePlaces();
  Future<void> addToVisitingPlaces(int id);
  Future<void> removeFromVisiting(int id);
  Future<List<String>?> getVisitingPlaces();
}