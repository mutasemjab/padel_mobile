// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourtModel _$CourtModelFromJson(Map<String, dynamic> json) => _CourtModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: json['type'] as String?,
);

Map<String, dynamic> _$CourtModelToJson(_CourtModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };

_VenueModel _$VenueModelFromJson(Map<String, dynamic> json) => _VenueModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  city: json['city'] as String? ?? '',
  address: json['address'] as String?,
  description: json['description'] as String?,
  latitude: json['latitude'] as num?,
  longitude: json['longitude'] as num?,
  imageUrl: json['image_url'] as String?,
  courts:
      (json['courts'] as List<dynamic>?)
          ?.map((e) => CourtModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  courtsCount: (json['courts_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$VenueModelToJson(_VenueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'address': instance.address,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'image_url': instance.imageUrl,
      'courts': instance.courts.map((e) => e.toJson()).toList(),
      'courts_count': instance.courtsCount,
    };
