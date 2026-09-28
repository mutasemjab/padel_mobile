import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/ranking_entry.dart';
import '../../domain/repositories/rankings_repository.dart';
import '../datasources/rankings_remote_data_source.dart';
import '../models/ranking_entry_model.dart';

class RankingsRepositoryImpl implements RankingsRepository {
  final RankingsRemoteDataSource remote;

  RankingsRepositoryImpl(this.remote);

  @override
  ApiResult<Paginated<RankingEntry>> getRankings({
    RankingType type = RankingType.season,
    String? season,
    String? level,
    String? q,
    int page = 1,
  }) =>
      guard(() async {
        final result = await remote.getRankings(type: type, season: season, level: level, q: q, page: page);
        return result.map((e) => e.toEntity());
      });

  @override
  ApiResult<List<Season>> getSeasons() => guard(remote.getSeasons);

  @override
  ApiResult<MyRanking> getMyRanking() => guard(remote.getMyRanking);
}
