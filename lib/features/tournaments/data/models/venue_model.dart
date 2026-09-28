import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/venue.dart';

part 'venue_model.freezed.dart';
part 'venue_model.g.dart';

@freezed
abstract class CourtModel with _$CourtModel {
  const factory CourtModel({required int id, required String name, String? type}) = _CourtModel;

  factory CourtModel.fromJson(Map<String, dynamic> json) => _$CourtModelFromJson(json);
}

extension CourtModelX on CourtModel {
  Court toEntity() => Court(id: id, name: name, type: type);
}

@freezed
abstract class VenueModel with _$VenueModel {
  const factory VenueModel({
    required int id,
    required String name,
    @Default('') String city,
    String? address,
    String? description,
    num? latitude,
    num? longitude,
    @JsonKey(name: 'image_url') String? imageUrl,
    @Default([]) List<CourtModel> courts,
    @JsonKey(name: 'courts_count') int? courtsCount,
  }) = _VenueModel;

  factory VenueModel.fromJson(Map<String, dynamic> json) => _$VenueModelFromJson(json);
}

extension VenueModelX on VenueModel {
  Venue toEntity() => Venue(
        id: id,
        name: name,
        city: city,
        address: address,
        description: description,
        latitude: latitude?.toDouble(),
        longitude: longitude?.toDouble(),
        imageUrl: imageUrl,
        courts: courts.map((c) => c.toEntity()).toList(),
        courtsCount: courtsCount,
      );
}
