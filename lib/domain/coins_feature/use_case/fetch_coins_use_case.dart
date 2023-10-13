import 'dart:ffi';

import 'package:gu_mobile/domain/coins_feature/coins_repository.dart';

class FetchCoinsUseCase {
  final CoinsRepository _repository;

  FetchCoinsUseCase(this._repository);

  Future<bool> execute(int count, int page) async {
    try {
      return _repository.fetchCoins(count, page);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
