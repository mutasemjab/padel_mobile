import '../../../../core/state/base_cubits.dart';
import '../../domain/usecases/profile_usecases.dart';

/// Own-profile edits: personal fields, photo upload, password. Success
/// results carry the updated `Player` so the caller can refresh [AuthBloc].
class EditProfileCubit extends ActionCubit {
  final UpdateProfileUseCase updateProfile;
  final UploadProfilePhotoUseCase uploadPhoto;
  final ChangePasswordUseCase changePassword;

  EditProfileCubit({required this.updateProfile, required this.uploadPhoto, required this.changePassword});

  Future<bool> save(Map<String, dynamic> fields) => run(() => updateProfile(fields));

  Future<bool> upload(String filePath) => run(() => uploadPhoto(filePath));

  Future<bool> updatePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) => run(
    () => changePassword(
      currentPassword: currentPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    ),
  );
}
