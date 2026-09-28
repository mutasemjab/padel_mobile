import '../../../../core/network/api_result.dart';
import '../../../players/domain/entities/player.dart';
import '../repositories/auth_repository.dart';

/// Wraps `GET auth/me` — used on app start to verify a stored token is
/// still valid and to refresh the cached profile.
class GetCurrentPlayerUseCase {
  final AuthRepository repository;

  GetCurrentPlayerUseCase(this.repository);

  ApiResult<Player> call() => repository.me();
}
