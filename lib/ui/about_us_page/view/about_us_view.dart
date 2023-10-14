import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/about_us_page/view/our_team_overview.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: OurTeamOverview());
  }
}
