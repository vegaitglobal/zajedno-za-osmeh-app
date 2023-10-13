import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/ui/coins_feature/view/coins_view.dart';
import 'package:gu_mobile/ui/example_feature/view/example_view.dart';

import 'app_routes.dart';

GoRouter get router => _router;

final _router = GoRouter(initialLocation: AppRoutes.coinsList.path(), routes: [
  ShellRoute(
      builder: (context, state, child) {
        return Stack(children: [
          child,
// const Align(
//   alignment: Alignment.bottomCenter,
//   child: TapBar(),
// ),
        ]);
      },
      routes: [
        GoRoute(
            path: AppRoutes.example.path(),
            name: AppRoutes.example.name,
            builder: (context, state) {
              return const ExampleView();
            }),
        GoRoute(
            path: AppRoutes.coinsList.path(),
            name: AppRoutes.coinsList.name,
            builder: (context, state) {
              return  CoinsView();
            })
      ])
]);
