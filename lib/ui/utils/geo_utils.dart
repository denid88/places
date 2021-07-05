import 'dart:math';
import 'package:places/domain/entities/coords.dart';

arePointsNear(Coords checkPoint, Coords centerPoint, double m) {
  double ky = 40000 / 360;
  double kx = cos(pi * centerPoint.lat / 180.0) * ky;
  double dx = (centerPoint.lng - checkPoint.lng).abs() * kx;
  double dy = (centerPoint.lat - checkPoint.lat).abs() * ky;
  return sqrt(dx * dx + dy * dy) <= (m / 1000).round();
}