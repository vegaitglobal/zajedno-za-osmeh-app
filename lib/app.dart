import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/data/example_feature/repository/example_repository_impl.dart';
import 'package:gu_mobile/di/injector.dart';
import 'package:gu_mobile/domain/coins_feature/use_case/observe_coins_use_case.dart';
import 'package:gu_mobile/domain/coins_feature/use_case/fetch_coins_use_case.dart';
import 'package:gu_mobile/domain/example_feature/use_case/example_use_case.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/coins_feature/bloc/coins_bloc.dart';
import 'package:gu_mobile/ui/example_feature/bloc/example_bloc.dart';

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
