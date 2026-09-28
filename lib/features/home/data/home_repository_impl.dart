import 'package:dio/dio.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_envelope.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/guard.dart';
import '../domain/entities/home_feed.dart';
import '../domain/home_repository.dart';
import 'models/home_feed_mapper.dart';

abstract class HomeRemoteDataSource {
  Future<HomeFeed> getHome();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<HomeFeed> getHome() async {
    final response = await dio.get(ApiEndpoints.home);
    return HomeFeedMapper.fromJson(ApiEnvelope.map(response));
  }
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl(this.remote);

  @override
  ApiResult<HomeFeed> getHome() => guard(remote.getHome);
}
