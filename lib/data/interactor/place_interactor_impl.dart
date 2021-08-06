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
  Future<void> addToVisitingPlaces(place) async {
    // TODO: implement addToVisitingPlaces
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
  Future<List<Place>> getVisitPlaces() async {
    // TODO: implement getVisitPlaces
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromFavorites(Place place) async {
    // TODO: implement removeFromFavorites
  }
}