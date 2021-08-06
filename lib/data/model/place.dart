class Place {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final String placeType;
  final String description;
  final List urls;
  bool isFavorite;
  bool isVisited;
  
  Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.placeType,
    required this.description,
    required this.urls,
    this.isFavorite = false,
    this.isVisited = false
  });

  Place copyWith({
    int? id,
    double? lat,
    double? lng,
    String? name,
    String? placeType,
    String? description,
    List? urls,
    bool? isFavorite,
    bool? isVisited
  }) {
    return Place(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      placeType: placeType ?? this.placeType,
      description: description ?? this.description,
      urls: urls ?? this.urls,
      isFavorite: isFavorite ?? this.isFavorite,
      isVisited: isVisited ?? this.isVisited
    );
  }

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
      urls: urls,
      isFavorite: false,
      isVisited: false
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