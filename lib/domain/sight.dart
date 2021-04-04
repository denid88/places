import 'package:flutter/material.dart';

class Sight {
  final String name;
  final double lat;
  final double lng;
  final String url;
  final String details;
  final String type;
  final String date;
  final bool isVisited;

  const Sight({
    @required this.name,
    @required this.lat,
    @required this.lng,
    @required this.url,
    @required this.details,
    @required this.type,
    @required this.date,
    this.isVisited = false
  });
}