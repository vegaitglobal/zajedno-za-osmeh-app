import 'package:gu_mobile/data/authentication/authentication_repository.dart';
import 'package:gu_mobile/data/authentication/i_authentication_repository.dart';
import 'package:gu_mobile/data/authentication/local/user_storage.dart';
import 'package:gu_mobile/data/authentication/local/user_storage_impl.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repository.dart';
import 'package:gu_mobile/data/about_us_page/repository/team_members_repository.dart';
import 'package:gu_mobile/data/core/dio_service.dart';
import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/data/core/token/token_manager.dart';
import 'package:gu_mobile/data/donate_page/repository/organization_repository.dart';
import 'package:gu_mobile/data/example_feature/local/example_storage.dart';
import 'package:gu_mobile/data/example_feature/local/example_storage_impl.dart';
import 'package:gu_mobile/data/example_feature/repository/example_repository_impl.dart';
import 'package:gu_mobile/data/example_feature/service/example_api_service.dart';
import 'package:gu_mobile/data/qr_verification_page/repository/qr_code_status_repository.dart';
import 'package:gu_mobile/data/filter_feature/repository/filter_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.dart';

void initExampleServices() {
  _initServices();
  _initRepositories();
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
  getIt.registerLazySingleton<UserStorage>(
      () => UserStorageImpl(getIt<SharedPreferences>()));

  getIt.registerLazySingleton<ExampleRepository>(
      () => ExampleRepository(getIt<ExampleApiService>()));
  getIt.registerLazySingleton<BenefitsRepo>(() => BenefitsRepository());

  getIt.registerLazySingleton<TeamMembersRepository>(
      () => TeamMembersRepository());

  getIt.registerLazySingleton<OrganizationRepository>(
      () => OrganizationRepository());

  getIt.registerLazySingleton<QRCodeStatusRepository>(
          () => QRCodeStatusRepository());

  getIt.registerLazySingleton<FilterRepository>(
      () => FilterRepository());

  getIt.registerLazySingleton<IAuthenticationRepository>(() =>
      AuthenticationRepository(supabaseClient.auth, getIt<UserStorage>()));
}
