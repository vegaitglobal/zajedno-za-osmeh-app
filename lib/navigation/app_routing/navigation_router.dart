import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/ui/benefits_page/view/benefits_view.dart';
import 'package:gu_mobile/ui/coins_feature/view/coins_view.dart';
import 'package:gu_mobile/ui/example_feature/view/example_view.dart';

import '../../ui/about_us_page/view/about_us_view.dart';
import '../../ui/benefit_detail_page/view/benefit_detail_view.dart';
import '../../ui/home_page/view/home_view.dart';
import 'app_routes.dart';

GoRouter get router => _router;

final _router = GoRouter(initialLocation: AppRoutes.home.path(), routes: [
  ShellRoute(
      builder: (context, state, child) {
        return Stack(children: [
          child,
        ]);
      },
      routes: [
        GoRoute(
            path: AppRoutes.home.path(),
            name: AppRoutes.home.name,
            builder: (context, state) {
              return const HomeView();
            }),
        GoRoute(
            path: AppRoutes.benefits.path(),
            name: AppRoutes.benefits.name,
            builder: (context, state) {
              return  const BenefitsView();
            }),
        GoRoute(
            path: AppRoutes.benefitDetail.path(),
            name: AppRoutes.benefitDetail.name,
            builder: (context, state) {
              return BenefitDetailView(benefitId: state.pathParameters['benefitId']!);
            }),
        GoRoute(
            path: AppRoutes.aboutUs.path(),
            name: AppRoutes.aboutUs.name,
            builder: (context, state) {
              return const AboutUsView();
            })
      ])
]);