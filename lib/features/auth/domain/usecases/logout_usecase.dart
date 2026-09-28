import '../../../../core/network/api_result.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  ApiResult<void> call() => repository.logout();
}
