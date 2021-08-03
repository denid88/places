import 'dart:math';
import 'package:places/domain/entities/coords.dart';

arePointsNear(Coords checkPoint, Coords centerPoint, double m) {
  double ky = 40000 / 360;
  double kx = cos(pi * centerPoint.lat / 180.0) * ky;
  double dx = (centerPoint.lng - checkPoint.lng).abs() * kx;
  double dy = (centerPoint.lat - checkPoint.lat).abs() * ky;
  return sqrt(dx * dx + dy * dy) <= (m / 1000).round();
}

degreesToRadians(degrees) {
  return degrees * pi / 180;
}

double distanceInKmBetweenEarthCoordinates(double lat1, double lon1, double lat2, double lon2) {
  final earthRadiusKm = 6371;

  final dLat = degreesToRadians(lat2 - lat1);
  final dLon = degreesToRadians(lon2 - lon1);

  lat1 = degreesToRadians(lat1);
  lat2 = degreesToRadians(lat2);

  final a = sin(dLat / 2) * sin(dLat / 2) +
    sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadiusKm * c;
}