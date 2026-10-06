import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/create_casual_match_usecase.dart';

sealed class CreateCasualMatchState extends Equatable {
  const CreateCasualMatchState();
  @override
  List<Object?> get props => [];
}

class CreateCasualMatchIdle extends CreateCasualMatchState {
  const CreateCasualMatchIdle();
}

class CreateCasualMatchSubmitting extends CreateCasualMatchState {
  const CreateCasualMatchSubmitting();
}

class CreateCasualMatchSuccess extends CreateCasualMatchState {
  const CreateCasualMatchSuccess();
}

class CreateCasualMatchFailure extends CreateCasualMatchState {
  final Failure failure;
  const CreateCasualMatchFailure(this.failure);
  @override
  List<Object?> get props => [failure];
}

/// Backs the "create casual match" sheet — deliberately separate from
/// [CasualMatchesBloc] so a failed submission doesn't clobber the
/// already-loaded list state.
class CreateCasualMatchCubit extends Cubit<CreateCasualMatchState> {
  final CreateCasualMatchUseCase createCasualMatch;

  CreateCasualMatchCubit(this.createCasualMatch) : super(const CreateCasualMatchIdle());

  Future<void> submit({
    String? title,
    int? venueId,
    int? courtId,
    required String matchType,
    required DateTime scheduledAt,
    String? requiredLevel,
    String? preferredSide,
    String? notes,
  }) async {
    emit(const CreateCasualMatchSubmitting());
    final result = await createCasualMatch(
      title: title,
      venueId: venueId,
      courtId: courtId,
      matchType: matchType,
      scheduledAt: scheduledAt,
      requiredLevel: requiredLevel,
      preferredSide: preferredSide,
      notes: notes,
    );
    result.match(
      (failure) => emit(CreateCasualMatchFailure(failure)),
      (_) => emit(const CreateCasualMatchSuccess()),
    );
  }

  void reset() => emit(const CreateCasualMatchIdle());
}
