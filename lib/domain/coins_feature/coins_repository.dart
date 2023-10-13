import 'model/coin_model.dart';

abstract class CoinsRepository {
  Future<bool> fetchCoins(int count, int page);

  Stream<List<CoinModel>> get coinList;

  Future<List<CoinModel>> getCoinsDatabase();
}
