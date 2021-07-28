class Place {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final String placeType;
  final String description;
  final List urls;
  
  const Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.placeType,
    required this.description,
    required this.urls
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final int id = json['id'];
    final double lat = json['lat'] ?? 0.0;
    final double lng = json['lng'] ?? 0.0;
    final String name = json['name'] ?? '';
    final String placeType = json['placeType'] ?? '';
    final String description = json['description'] ?? '';
    final List urls = json['urls'] ?? [];
    return Place(
      id: id,
      lat: lat,
      lng: lng,
      name: name,
      placeType: placeType,
      description: description,
      urls: urls
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'lat': lat,
    'lng': lng,
    'name': name,
    'placeType': placeType,
    'description': description,
    'urls': urls
  };
}