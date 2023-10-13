import 'package:drift/drift.dart';
import 'package:gu_mobile/data/core/database.dart';
import 'package:gu_mobile/data/coins_feature/model/coins_response.dart';

class CoinDatabase {
  final AppDatabase database;

  CoinDatabase({required this.database});

  Future<void> addCoins(List<CoinsResponse> coins) async {
    for (var coin in coins) {
      await database.into(database.coinTable).insertOnConflictUpdate(
          CoinTableCompanion.insert(
              id: coin.id,
              symbol: coin.symbol,
              name: coin.name,
              image: Value(coin.image),
              currentPrice: coin.currentPrice));
    }
  }

  Stream<List<CoinTableData>> get coinDatabaseList {
    return database.select(database.coinTable).watch();
  }

  Future<List<CoinTableData>> getCoins() async {
    return await database.select(database.coinTable).get();
  }
}
