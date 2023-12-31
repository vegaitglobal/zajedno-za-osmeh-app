import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/data/about_us_page/repository/team_members_repository.dart';
import 'package:gu_mobile/data/authentication/i_authentication_repository.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';
import 'package:gu_mobile/data/donate_page/repository/organization_repository.dart';
import 'package:gu_mobile/data/profile/repository/donee_repository.dart';
import 'package:gu_mobile/data/filter_feature/repository/filter_repository_impl.dart';
import 'package:gu_mobile/di/injector.dart';
import 'package:gu_mobile/ui/about_us_page/bloc/about_us_bloc.dart';
import 'package:gu_mobile/ui/authentication/bloc/authentication_bloc.dart';
import 'package:gu_mobile/ui/benefits_feature/bloc/benefits_bloc.dart';
import 'package:gu_mobile/ui/common/bottom_nav_bloc.dart';
import 'package:gu_mobile/ui/donate_page/bloc/donate_page_bloc.dart';
import 'package:gu_mobile/ui/my_qr_code_page/view/my_qr_code_view.dart';
import 'package:gu_mobile/ui/profile_page/bloc/profile_bloc.dart';
import 'package:gu_mobile/ui/qr_verification_page/bloc/qr_verification_bloc.dart';
import 'data/qr_verification_page/repository/qr_code_status_repository.dart';
import 'package:gu_mobile/ui/register_feature/bloc/register_bloc.dart';
import 'navigation/app_routing/navigation_router.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BenefitsBloc(
              benefitsRepository: getIt<BenefitsRepo>(),
              filterRepository: getIt<FilterRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                AboutUsBloc(repository: getIt<TeamMembersRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                DonatePageBloc(repository: getIt<OrganizationRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                QRVerificationBloc(repository: getIt<QRCodeStatusRepository>()),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(
                repository: getIt<IAuthenticationRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                RegisterBloc(repository: getIt<IAuthenticationRepository>()),
          ),
          BlocProvider(
              create: (context) =>
                  ProfileBloc(repository: getIt<ProfileRepository>())),
          BlocProvider(
              create: (context) => BottomNavBloc(
                  authRepository: getIt<IAuthenticationRepository>())),
          BlocProvider(
              create: (context) =>
                  QrCodeBloc(repository: getIt<IAuthenticationRepository>())),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: 'Poppins',
          ),
        ));
  }
}
