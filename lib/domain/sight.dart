class Sight {
  final String name;
  final double lat;
  final double lng;
  final String url;
  final String details;
  final String type;
  final String date;
  final bool isVisited;
  final bool isFavorite;

  const Sight({
    required this.name,
    required this.lat,
    required this.lng,
    required this.url,
    required this.details,
    required this.type,
    required this.date,
    this.isVisited = false,
    this.isFavorite = false
  });

  Sight copyWith({
    name,
    lat,
    lng,
    url,
    details,
    type,
    date,
    isVisited,
    isFavorite
  }) => Sight(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      url: url ?? this.url,
      details: details ?? this.details,
      type: type ?? this.type,
      date: date ?? this.date,
      isVisited: isVisited ?? this.isVisited,
      isFavorite: isFavorite ?? this.isFavorite
  );
}