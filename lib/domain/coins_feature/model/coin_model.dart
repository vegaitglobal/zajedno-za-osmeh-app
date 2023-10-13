import 'package:gu_mobile/data/core/database.dart';

class CoinModel {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;

  CoinModel({required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice});
}

extension CoinTableDataExtension on CoinTableData {
  CoinModel toDomain() =>
      CoinModel(id: id,
          symbol: symbol,
          name: name,
          image: image ?? "",
          currentPrice: currentPrice);
}
