import 'package:places/data/model/place.dart';
import 'package:places/domain/interactor/place_interactor.dart';
import 'package:places/domain/repository/place_repository.dart';

class PlaceInteractorImpl extends PlaceInteractor {

  final PlaceRepository placeRepository;

  PlaceInteractorImpl({required this.placeRepository});

  @override
  void addNewPlace(Place place) {
    // TODO: implement addNewPlace
  }

  @override
  void addToFavorites(Place place) {
    // TODO: implement addToFavorites
  }

  @override
  void addToVisitingPlaces(place) {
    // TODO: implement addToVisitingPlaces
  }

  @override
  List<Place> getFavoritesPlaces() {
    // TODO: implement getFavoritesPlaces
    throw UnimplementedError();
  }

  @override
  Place getPlaceDetails(int id) {
    // TODO: implement getPlaceDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Place>> getPlaces(int radius, String category) async {
    return placeRepository.getPlaces(radius, category);
  }

  @override
  List<Place> getVisitPlaces() {
    // TODO: implement getVisitPlaces
    throw UnimplementedError();
  }

  @override
  void removeFromFavorites(Place place) {
    // TODO: implement removeFromFavorites
  }
}