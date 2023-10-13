import 'package:gu_mobile/data/coins_feature/database/coin_database.dart';
import 'package:gu_mobile/data/core/database.dart';
import 'package:gu_mobile/data/coins_feature/repository/coins_repository_impl.dart';
import 'package:gu_mobile/data/coins_feature/service/coins_api_service.dart';
import 'package:gu_mobile/data/core/dio_service.dart';
import 'package:gu_mobile/data/core/token/token_manager.dart';
import 'package:gu_mobile/domain/coins_feature/coins_repository.dart';
import 'package:gu_mobile/domain/coins_feature/use_case/observe_coins_use_case.dart';
import 'package:gu_mobile/domain/coins_feature/use_case/fetch_coins_use_case.dart';

import 'injector.dart';

void initCoinsServices() {
  _initServices();
  _initRepositories();
  _initUseCases();
}

void _initServices() {
  getIt.registerLazySingleton(
      () => DioService(
          baseUrl: "https://api.coingecko.com/api/v3/",
          tokenManager: getIt<TokenManager>()),
      instanceName: 'coinsApi');

  getIt.registerLazySingleton<CoinsApiService>(
      () => CoinsApiService(getIt<DioService>(instanceName: 'coinsApi')));

  getIt.registerLazySingleton<CoinDatabase>(
      () => CoinDatabase(database: getIt<AppDatabase>()));
}

void _initRepositories() {
  getIt.registerLazySingleton<CoinsRepository>(() =>
      CoinsRepositoryImpl(getIt<CoinsApiService>(), getIt<CoinDatabase>()));
}

void _initUseCases() {
  getIt.registerLazySingleton<FetchCoinsUseCase>(
      () => FetchCoinsUseCase(getIt<CoinsRepository>()));

  getIt.registerLazySingleton<ObserveCoinsUseCase>(
      () => ObserveCoinsUseCase(getIt<CoinsRepository>()));
}
