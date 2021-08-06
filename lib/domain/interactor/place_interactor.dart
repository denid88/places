import 'package:places/data/model/place.dart';

abstract class PlaceInteractor {
  Future<List<Place>> getPlaces(double radius, String category);
  Future<Place> getPlaceDetails(int id);
  Future<List<String>?> getFavoritePlaces();
  Future<void> addToFavorites(Place place);
  Future<void> removeFromFavorites(int id);
  Future<List<String>?> getVisitPlaces();
  Future<void> addToVisitingPlaces(Place place);
  Future<void> removeFromVisiting(int id);
  Future<void> addNewPlace(Place place);
}