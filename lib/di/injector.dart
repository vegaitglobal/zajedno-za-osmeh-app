import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:gu_mobile/data/core/database.dart';
import 'package:gu_mobile/data/core/token/token_manager.dart';
import 'package:gu_mobile/data/core/token/token_manager_impl.dart';
import 'package:gu_mobile/di/example_di.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'coins_di.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  await _initSharedPref();

  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<TokenManager>(
      TokenManagerImpl(getIt<SharedPreferences>()));

  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  initCoinsServices();
  initExampleServices();
}

Future<void> _initSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPref);
}
