import 'package:equatable/equatable.dart';

class Court extends Equatable {
  final int id;
  final String name;
  final String? type;

  const Court({required this.id, required this.name, this.type});

  @override
  List<Object?> get props => [id, name, type];
}

class Venue extends Equatable {
  final int id;
  final String name;
  final String city;
  final String? address;
  final String? description;
  final double? latitude;
  final double? longitude;
  final String? imageUrl;

  /// Google Maps link from the server (the admin's pasted link, or built from the coordinates).
  final String? mapsUrl;
  final List<Court> courts;
  final int? courtsCount;

  const Venue({
    required this.id,
    required this.name,
    required this.city,
    this.address,
    this.description,
    this.latitude,
    this.longitude,
    this.imageUrl,
    this.mapsUrl,
    this.courts = const [],
    this.courtsCount,
  });

  bool get hasLocation => mapUri != null;

  /// Opens the place in Google Maps (app or browser).
  Uri? get mapUri {
    if (mapsUrl != null && mapsUrl!.isNotEmpty) return Uri.tryParse(mapsUrl!);
    if (latitude != null && longitude != null) {
      return Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    }
    return null;
  }

  String get displayName => city.isEmpty ? name : '$name, $city';

  @override
  List<Object?> get props =>
      [id, name, city, address, description, latitude, longitude, imageUrl, courts, courtsCount];
}
