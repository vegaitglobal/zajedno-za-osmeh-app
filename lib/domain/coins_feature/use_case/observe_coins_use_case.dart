import 'package:gu_mobile/domain/coins_feature/coins_repository.dart';
import 'package:gu_mobile/domain/coins_feature/model/coin_model.dart';

class ObserveCoinsUseCase {
  final CoinsRepository _repository;

  ObserveCoinsUseCase(this._repository);

  Stream<List<CoinModel>> execute() {
    try {
      return _repository.coinList;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
