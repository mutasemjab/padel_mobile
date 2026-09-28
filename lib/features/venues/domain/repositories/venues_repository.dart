import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../tournaments/domain/entities/venue.dart';
import '../entities/venue_detail.dart';

abstract class VenuesRepository {
  ApiResult<Paginated<Venue>> getVenues({String? city, String? q, int page = 1});
  ApiResult<VenueDetail> getVenue(int id);
}
