import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../tournaments/domain/entities/venue.dart';
import '../../domain/entities/venue_detail.dart';
import '../../domain/repositories/venues_repository.dart';
import '../datasources/venues_remote_data_source.dart';

class VenuesRepositoryImpl implements VenuesRepository {
  final VenuesRemoteDataSource remote;

  VenuesRepositoryImpl(this.remote);

  @override
  ApiResult<Paginated<Venue>> getVenues({String? city, String? q, int page = 1}) =>
      guard(() => remote.getVenues(city: city, q: q, page: page));

  @override
  ApiResult<VenueDetail> getVenue(int id) => guard(() => remote.getVenue(id));
}
