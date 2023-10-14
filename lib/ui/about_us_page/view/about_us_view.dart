import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/about_us_page/view/our_team_overview.dart';

import '../../common/custom_bottom_navigation_bar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: OurTeamOverview());
  }
}
