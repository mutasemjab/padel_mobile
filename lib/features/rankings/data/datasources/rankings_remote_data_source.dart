import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/ranking_entry.dart';
import '../models/ranking_entry_model.dart';

abstract class RankingsRemoteDataSource {
  Future<Paginated<RankingEntryModel>> getRankings({
    RankingType type = RankingType.season,
    String? season,
    String? level,
    String? q,
    int page = 1,
  });
  Future<List<Season>> getSeasons();
  Future<MyRanking> getMyRanking();
}

class RankingsRemoteDataSourceImpl implements RankingsRemoteDataSource {
  final Dio dio;

  RankingsRemoteDataSourceImpl(this.dio);

  @override
  Future<Paginated<RankingEntryModel>> getRankings({
    RankingType type = RankingType.season,
    String? season,
    String? level,
    String? q,
    int page = 1,
  }) async {
    final response = await dio.get(ApiEndpoints.rankings, queryParameters: {
      'type': type.apiValue,
      'season': ?season,
      'level': ?level,
      if (q != null && q.isNotEmpty) 'q': q,
      'page': page,
    });
    return ApiEnvelope.paginated(response, RankingEntryModel.fromJson);
  }

  @override
  Future<List<Season>> getSeasons() async {
    final response = await dio.get(ApiEndpoints.rankingSeasons);
    return ApiEnvelope.listOf(response, (j) => SeasonModel.fromJson(j).toEntity());
  }

  @override
  Future<MyRanking> getMyRanking() async {
    final response = await dio.get(ApiEndpoints.myRanking);
    return myRankingFromJson(ApiEnvelope.map(response));
  }
}
