import 'package:gu_mobile/data/core/dio_service.dart';
import 'package:gu_mobile/data/core/token/token_manager.dart';
import 'package:gu_mobile/data/example_feature/local/example_storage.dart';
import 'package:gu_mobile/data/example_feature/local/example_storage_impl.dart';
import 'package:gu_mobile/data/example_feature/repository/example_repository_impl.dart';
import 'package:gu_mobile/data/example_feature/service/example_api_service.dart';
import 'package:gu_mobile/domain/example_feature/example_repository.dart';
import 'package:gu_mobile/domain/example_feature/use_case/example_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.dart';

void initExampleServices() {
  _initServices();
  _initRepositories();
  _initUseCases();
}

void _initServices() {
  getIt.registerLazySingleton<ExampleStorage>(
      () => ExampleStorageImpl(getIt<SharedPreferences>()));

  getIt.registerLazySingleton(
      () => DioService(
          baseUrl: "https://swapi.dev/api/",
          tokenManager: getIt<TokenManager>()),
      instanceName: 'exampleApi');

  getIt.registerLazySingleton<ExampleApiService>(
      () => ExampleApiService(getIt<DioService>(instanceName: 'exampleApi')));
}

void _initRepositories() {
  getIt.registerLazySingleton<ExampleRepository>(
      () => ExampleRepositoryImpl(getIt<ExampleApiService>()));
}

void _initUseCases() {
  getIt.registerLazySingleton<ExampleUseCase>(
      () => ExampleUseCase(getIt<ExampleRepository>()));
}