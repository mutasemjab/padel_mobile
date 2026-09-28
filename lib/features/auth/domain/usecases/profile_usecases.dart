import '../../../../core/network/api_result.dart';
import '../../../players/domain/entities/player.dart';
import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class RestoreSessionUseCase {
  final AuthRepository repository;
  RestoreSessionUseCase(this.repository);
  ApiResult<AuthSession> call() => repository.restoreSession();
}

class UpdateProfileUseCase {
  final AuthRepository repository;
  UpdateProfileUseCase(this.repository);
  ApiResult<Player> call(Map<String, dynamic> fields) => repository.updateProfile(fields);
}

class UploadProfilePhotoUseCase {
  final AuthRepository repository;
  UploadProfilePhotoUseCase(this.repository);
  ApiResult<Player> call(String filePath) => repository.uploadPhoto(filePath);
}

class ChangePasswordUseCase {
  final AuthRepository repository;
  ChangePasswordUseCase(this.repository);
  ApiResult<void> call({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) => repository.changePassword(
    currentPassword: currentPassword,
    password: password,
    passwordConfirmation: passwordConfirmation,
  );
}
