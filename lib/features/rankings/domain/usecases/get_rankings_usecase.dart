import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/ranking_entry.dart';
import '../repositories/rankings_repository.dart';

class GetRankingsUseCase {
  final RankingsRepository repository;

  GetRankingsUseCase(this.repository);

  ApiResult<Paginated<RankingEntry>> call({
    RankingType type = RankingType.season,
    String? season,
    String? level,
    String? q,
    int page = 1,
  }) =>
      repository.getRankings(type: type, season: season, level: level, q: q, page: page);
}

class GetSeasonsUseCase {
  final RankingsRepository repository;

  GetSeasonsUseCase(this.repository);

  ApiResult<List<Season>> call() => repository.getSeasons();
}

class GetMyRankingUseCase {
  final RankingsRepository repository;

  GetMyRankingUseCase(this.repository);

  ApiResult<MyRanking> call() => repository.getMyRanking();
}
