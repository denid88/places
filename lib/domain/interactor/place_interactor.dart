import 'package:places/data/model/place.dart';

abstract class PlaceInteractor {
  Future<List<Place>> getPlaces(double radius, String category);
  Future<Place> getPlaceDetails(int id);
  Future<List<String>?> getFavoritePlaces();
  Future<void> addToFavorites(Place place);
  Future<void> removeFromFavorites(Place place);
  Future<List<Place>> getVisitPlaces();
  Future<void> addToVisitingPlaces(place);
  Future<void> addNewPlace(Place place);
}