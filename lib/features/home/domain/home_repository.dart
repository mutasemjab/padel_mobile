import '../../../core/network/api_result.dart';
import 'entities/home_feed.dart';

abstract class HomeRepository {
  ApiResult<HomeFeed> getHome();
}

class GetHomeFeedUseCase {
  final HomeRepository repository;

  GetHomeFeedUseCase(this.repository);

  ApiResult<HomeFeed> call() => repository.getHome();
}
