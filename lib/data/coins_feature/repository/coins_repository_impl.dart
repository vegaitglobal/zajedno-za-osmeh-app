import 'package:gu_mobile/data/coins_feature/database/coin_database.dart';
import 'package:gu_mobile/data/coins_feature/service/coins_api_service.dart';
import 'package:gu_mobile/domain/coins_feature/coins_repository.dart';
import 'package:gu_mobile/domain/coins_feature/model/coin_model.dart';

class CoinsRepositoryImpl implements CoinsRepository {
  final CoinsApiService _apiService;
  final CoinDatabase _database;

  CoinsRepositoryImpl(this._apiService, this._database);

  @override
  Future<bool> fetchCoins(int count, int page) async {
    final response = await _apiService.fetchCoins(count, page, "en", "usd");
    await _database.addCoins(response);
    return response.isEmpty;
  }

  @override
  Stream<List<CoinModel>> get coinList => _database.coinDatabaseList
      .map((event) => event.map((e) => e.toDomain()).toList());

  @override
  Future<List<CoinModel>> getCoinsDatabase() async {
    final response = await _database.getCoins();
    return response.map((e) => e.toDomain()).toList();
  }
}
