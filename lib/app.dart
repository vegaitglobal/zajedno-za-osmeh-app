import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/data/about_us_page/repository/team_members_repository.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';
import 'package:gu_mobile/data/donate_page/repository/organization_repository.dart';
import 'package:gu_mobile/data/example_feature/repository/example_repository_impl.dart';
import 'package:gu_mobile/di/injector.dart';
import 'package:gu_mobile/ui/about_us_page/bloc/about_us_bloc.dart';
import 'package:gu_mobile/ui/benefits_feature/bloc/benefits_bloc.dart';
import 'package:gu_mobile/ui/donate_page/bloc/donate_page_bloc.dart';
import 'package:gu_mobile/ui/example_feature/bloc/example_bloc.dart';
import 'package:gu_mobile/ui/qr_verification_page/bloc/qr_verification_bloc.dart';

import 'data/qr_verification_page/repository/qr_code_status_repository.dart';
import 'navigation/app_routing/navigation_router.dart';

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ExampleBloc(repository: getIt<ExampleRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                BenefitsBloc(repository: getIt<BenefitsRepo>()),
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
