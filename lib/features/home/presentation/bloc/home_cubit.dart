import '../../../../core/network/api_result.dart';
import '../../../../core/state/base_cubits.dart';
import '../../domain/entities/home_feed.dart';
import '../../domain/home_repository.dart';

/// Loads the contextual `me/home` feed.
class HomeCubit extends ViewCubit<HomeFeed> {
  final GetHomeFeedUseCase getHomeFeed;

  HomeCubit(this.getHomeFeed);

  @override
  ApiResult<HomeFeed> fetch() => getHomeFeed();

  @override
  bool isEmpty(HomeFeed data) => data.ordered.isEmpty;
}
