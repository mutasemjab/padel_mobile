import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../tournaments/domain/entities/venue.dart';
import '../entities/venue_detail.dart';
import '../repositories/venues_repository.dart';

class GetVenuesUseCase {
  final VenuesRepository repository;
  GetVenuesUseCase(this.repository);
  ApiResult<Paginated<Venue>> call({String? city, String? q, int page = 1}) =>
      repository.getVenues(city: city, q: q, page: page);
}

class GetVenueUseCase {
  final VenuesRepository repository;
  GetVenueUseCase(this.repository);
  ApiResult<VenueDetail> call(int id) => repository.getVenue(id);
}
