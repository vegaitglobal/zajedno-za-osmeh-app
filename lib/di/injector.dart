import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:gu_mobile/data/core/database.dart';
import 'package:gu_mobile/data/core/token/token_manager.dart';
import 'package:gu_mobile/data/core/token/token_manager_impl.dart';
import 'package:gu_mobile/data/profile/repository/donee_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/about_us_page/repository/team_members_repository.dart';
import '../data/authentication/authentication_repository.dart';
import '../data/authentication/i_authentication_repository.dart';
import '../data/authentication/local/user_storage.dart';
import '../data/authentication/local/user_storage_impl.dart';
import '../data/benefits_feature/repository/benefits_repo.dart';
import '../data/benefits_feature/repository/benefits_repository.dart';
import '../data/core/supabase/supabase_client.dart';
import '../data/donate_page/repository/organization_repository.dart';
import '../data/filter_feature/repository/filter_repository_impl.dart';
import '../data/qr_verification_page/repository/qr_code_status_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  await _initSharedPref();

  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<TokenManager>(
      TokenManagerImpl(getIt<SharedPreferences>()));
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  _initRepositories();
}

Future<void> _initSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPref);
}

void _initRepositories() {
  getIt.registerLazySingleton<UserStorage>(
      () => UserStorageImpl(getIt<SharedPreferences>()));

  getIt.registerLazySingleton<BenefitsRepo>(() => BenefitsRepository());

  getIt.registerLazySingleton<TeamMembersRepository>(
      () => TeamMembersRepository());

  getIt.registerLazySingleton<OrganizationRepository>(
      () => OrganizationRepository());

  getIt.registerLazySingleton<QRCodeStatusRepository>(
      () => QRCodeStatusRepository());

  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository());

  getIt.registerLazySingleton<FilterRepository>(() => FilterRepository());

  getIt.registerLazySingleton<IAuthenticationRepository>(() =>
      AuthenticationRepository(supabaseClient.auth, getIt<UserStorage>()));
}
