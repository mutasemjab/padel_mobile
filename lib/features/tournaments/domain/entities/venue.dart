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
    this.courts = const [],
    this.courtsCount,
  });

  bool get hasLocation => latitude != null && longitude != null;

  String get displayName => city.isEmpty ? name : '$name, $city';

  @override
  List<Object?> get props =>
      [id, name, city, address, description, latitude, longitude, imageUrl, courts, courtsCount];
}
