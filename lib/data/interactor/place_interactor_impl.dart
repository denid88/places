import 'package:places/data/model/place.dart';
import 'package:places/domain/interactor/place_interactor.dart';
import 'package:places/domain/repository/place_repository.dart';

class PlaceInteractorImpl extends PlaceInteractor {

  final PlaceRepository placeRepository;

  PlaceInteractorImpl({required this.placeRepository});

  @override
  Future<void> addNewPlace(Place place) async {
    // TODO: implement addNewPlace
  }

  @override
  Future<void> addToFavorites(Place place) async {
    placeRepository.addToFavorites(place.id);
  }

  @override
  Future<List<String>?> getFavoritePlaces() async {
    return placeRepository.getFavoritePlaces();
  }

  @override
  Future<Place> getPlaceDetails(int id) async {
    return placeRepository.getPlaceById(id);
  }

  @override
  Future<List<Place>> getPlaces(double radius, String category) async {
    return placeRepository.getPlaces(radius, category);
  }

  @override
  Future<List<String>?> getVisitPlaces() async {
    return placeRepository.getVisitingPlaces();
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    placeRepository.removeFromFavorites(id);
  }

  @override
  Future<void> addToVisitingPlaces(Place place) async {
    placeRepository.addToVisitingPlaces(place.id);
  }

  @override
  Future<void> removeFromVisiting(int id) async {
    placeRepository.removeFromVisiting(id);
  }
}