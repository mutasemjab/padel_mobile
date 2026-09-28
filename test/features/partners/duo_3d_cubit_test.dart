import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:padel/core/error/failure.dart';
import 'package:padel/core/state/view_state.dart';
import 'package:padel/features/partners/data/models/duo_media_model.dart';
import 'package:padel/features/partners/domain/entities/duo_media.dart';
import 'package:padel/features/partners/domain/repositories/partners_repository.dart';
import 'package:padel/features/partners/domain/usecases/partners_usecases.dart';
import 'package:padel/features/partners/presentation/bloc/duo_3d_cubit.dart';

class _Repo extends Mock implements PartnersRepository {}

void main() {
  test('parses the duo-3d contract', () {
    final state = DuoMediaStateModel.fromJson({
      'provider_configured': true,
      'requires_photos': false,
      'current': {'id': 7, 'status': 'processing', 'media_type': 'video'},
      'latest_completed': {
        'id': 6,
        'status': 'completed',
        'media_type': 'image',
        'media_url': 'https://cdn/x.png',
      },
    }).toEntity();
    expect(state.current!.status.isPending, isTrue);
    expect(state.latestCompleted!.mediaType, DuoMediaType.image);
  });

  test('polls while the job is pending and stops once it completes', () {
    fakeAsync((async) {
      final repo = _Repo();
      var calls = 0;
      when(repo.getDuo3d).thenAnswer((_) async {
        calls++;
        final status = calls < 3 ? DuoMediaStatus.processing : DuoMediaStatus.completed;
        return Right(DuoMediaState(providerConfigured: true, current: DuoMedia(id: 1, status: status)));
      });
      final cubit = Duo3dCubit(getDuo: GetDuo3dUseCase(repo), requestDuo: RequestDuo3dUseCase(repo));

      cubit.load();
      async.flushMicrotasks();
      expect(calls, 1);
      async.elapse(Duo3dCubit.pollInterval * 3);
      expect(calls, 3);
      expect(cubit.state.view.dataOrNull!.current!.status, DuoMediaStatus.completed);
      async.elapse(Duo3dCubit.pollInterval * 3);
      expect(calls, 3, reason: 'no polling after completion');
      cubit.close();
    });
  });

  test('a failed generate keeps the loaded view and reports the failure', () async {
    final repo = _Repo();
    when(repo.getDuo3d).thenAnswer((_) async => const Right(DuoMediaState(providerConfigured: true)));
    when(repo.requestDuo3d).thenAnswer((_) async => const Left(ForbiddenFailure('Premium', ApiErrorCodes.premiumRequired)));
    final cubit = Duo3dCubit(getDuo: GetDuo3dUseCase(repo), requestDuo: RequestDuo3dUseCase(repo));
    await cubit.load();
    await cubit.generate();
    expect(cubit.state.view, isA<ViewLoaded<DuoMediaState>>());
    expect(cubit.state.lastFailure!.isPremiumRequired, isTrue);
    await cubit.close();
  });
}
