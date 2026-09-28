import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/utils/json_utils.dart';
import '../../../tournaments/data/models/tournament_model.dart';
import '../../../tournaments/data/models/venue_model.dart';
import '../../../tournaments/domain/entities/venue.dart';
import '../../domain/entities/venue_detail.dart';

abstract class VenuesRemoteDataSource {
  Future<Paginated<Venue>> getVenues({String? city, String? q, int page = 1});
  Future<VenueDetail> getVenue(int id);
}

class VenuesRemoteDataSourceImpl implements VenuesRemoteDataSource {
  final Dio dio;

  VenuesRemoteDataSourceImpl(this.dio);

  @override
  Future<Paginated<Venue>> getVenues({String? city, String? q, int page = 1}) async {
    final response = await dio.get(ApiEndpoints.venues, queryParameters: {
      if (city != null && city.isNotEmpty) 'city': city,
      if (q != null && q.isNotEmpty) 'q': q,
      'page': page,
    });
    return ApiEnvelope.paginated(response, (j) => VenueModel.fromJson(j).toEntity());
  }

  @override
  Future<VenueDetail> getVenue(int id) async {
    final response = await dio.get(ApiEndpoints.venue(id));
    final json = ApiEnvelope.map(response);
    return VenueDetail(
      venue: VenueModel.fromJson(json).toEntity(),
      upcomingTournaments:
          Json.listOfMaps(json['upcoming_tournaments']).map((t) => TournamentModel.fromJson(t).toEntity()).toList(),
    );
  }
}
