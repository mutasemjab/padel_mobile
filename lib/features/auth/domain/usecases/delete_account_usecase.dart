import '../../../../core/network/api_result.dart';
import '../repositories/auth_repository.dart';

class DeleteAccountUseCase {
  final AuthRepository repository;

  DeleteAccountUseCase(this.repository);

  ApiResult<void> call() => repository.deleteAccount();
}
