import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/casual_match.dart';
import '../repositories/casual_matches_repository.dart';

class GetCasualMatchUseCase {
  final CasualMatchesRepository repository;
  GetCasualMatchUseCase(this.repository);
  ApiResult<CasualMatch> call(int id) => repository.getCasualMatch(id);
}

class LeaveCasualMatchUseCase {
  final CasualMatchesRepository repository;
  LeaveCasualMatchUseCase(this.repository);
  ApiResult<void> call(int id) => repository.leaveCasualMatch(id);
}

class CancelCasualMatchUseCase {
  final CasualMatchesRepository repository;
  CancelCasualMatchUseCase(this.repository);
  ApiResult<void> call(int id) => repository.cancelCasualMatch(id);
}

class RespondToParticipantUseCase {
  final CasualMatchesRepository repository;
  RespondToParticipantUseCase(this.repository);
  ApiResult<void> call(int id, int participantId, {required bool accept}) =>
      repository.respondToParticipant(id, participantId, accept: accept);
}

class GetMyCasualMatchesUseCase {
  final CasualMatchesRepository repository;
  GetMyCasualMatchesUseCase(this.repository);
  ApiResult<Paginated<CasualMatch>> call({required bool created, int page = 1}) =>
      repository.getMyCasualMatches(created: created, page: page);
}
