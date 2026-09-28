import '../../../../core/network/api_result.dart';
import '../entities/player.dart';
import '../repositories/players_repository.dart';

class GetPlayerUseCase {
  final PlayersRepository repository;

  GetPlayerUseCase(this.repository);

  ApiResult<Player> call(String playerId) => repository.getPlayer(playerId);
}
