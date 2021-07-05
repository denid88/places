import 'package:places/data/model/place.dart';

abstract class PlaceInteractor {
  Future<List<Place>> getPlaces(int radius, String category);
  Place getPlaceDetails(int id);
  List<Place> getFavoritesPlaces();
  void addToFavorites(Place place);
  void removeFromFavorites(Place place);
  List<Place> getVisitPlaces();
  void addToVisitingPlaces(place);
  void addNewPlace(Place place);
}