import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/ranking_entry.dart';

abstract class RankingsRepository {
  ApiResult<Paginated<RankingEntry>> getRankings({
    RankingType type = RankingType.season,
    String? season,
    String? level,
    String? q,
    int page = 1,
  });
  ApiResult<List<Season>> getSeasons();
  ApiResult<MyRanking> getMyRanking();
}
