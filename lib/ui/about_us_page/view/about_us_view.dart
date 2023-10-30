import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/common/left_arrow_back_button.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/about_us_page/bloc/about_us_bloc.dart';
import 'package:gu_mobile/ui/about_us_page/bloc/about_us_event.dart';
import 'package:gu_mobile/ui/about_us_page/bloc/about_us_state.dart';
import 'package:gu_mobile/ui/about_us_page/model/team_members_ui_model.dart';
import 'package:gu_mobile/ui/about_us_page/view/our_team_overview.dart';

import '../../common/custom_appbar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AboutUsBloc>().add(const AboutUsFetchTeamMembers());

    List<String> goals = [
      "Unapređenje socijalne i zdravstvene zaštite dece u Republici Srbiji",
      "Podrška oboleloj deci i njihovim porodicama u cilju lečenja, medicinskog zbrinjavanja i oporavka",
      "Promovisanje i unapređenje sistema dečije zdravstvene zaštite",
      "Aktivnosti usmerene na promovisanje i zaštitu ljudskih, manjinskih i građanskih prava",
      "Unapređenje kulture i javnog informisanja",
      "Promovisanje i popularizacija nauke, obrazovanje, umetnosti i amaterskog sporta",
      "Unapređivanje položaja osoba sa invaliditetom",
      "Pomoć starima",
      "Briga o deci i omladini",
      "Promocija zdravih stilova života",
      "Zaštita životne sredine",
      "Prekogranična saradnja"
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: BlocListener<AboutUsBloc, AboutUsState>(
        listener: (BuildContext context, AboutUsState state) {},
        child: BlocBuilder<AboutUsBloc, AboutUsState>(
          builder: (context, state) {
            return switch (state) {
              AboutUsInitialState() => const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 16,
                    right: 16,
                  ),
                  child: LeftArrowBackButton(),
                ),
              AboutUsSuccessState() => ListView(children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 16,
                      right: 16,
                    ),
                    child: LeftArrowBackButton(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildWhoAreWeExpansionTile(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildGoalsOfFoundationExpansionTile(goals),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildOurTeamExpansionTile(state.teamMembers),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTermsExpansionTile(),
                ]),
              AboutUsFailureState() => const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 16,
                    right: 16,
                  ),
                  child: LeftArrowBackButton(),
                ),
            };
          },
        ),
      ),
    );
  }

  Widget _buildOurTeamExpansionTile(List<TeamMembersUIModel> teamMembers) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ExpansionTile(
          title: const Text(
            'Naš tim',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            OurTeamOverview(teamMembers: teamMembers),
          ],
        ),
      ),
    );
  }

  Padding _buildGoalsOfFoundationExpansionTile(List<String> goals) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ExpansionTile(
          title: const Text(
            'Ciljevi fondacije',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: goals.map((strone) {
                  return Row(
                    children: [
                      const Image(
                          image:
                              AssetImage('assets/images/icons/check_icon.png')),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          strone,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildWhoAreWeExpansionTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const ExpansionTile(
          title: Text(
            'Ko smo mi?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Fondacija „Zajedno za osmeh“  je osnovana sa željom, '
                      'grupe mladih ljudi, da svojim delovanjem pomognu unapređenje socijalne '
                      'i zdravstvene zaštite dece u Republici Srbiji, da pruže podršku '
                      'oboleloj deci i njihovim porodicama, u cilju lečenja, medicinskog '
                      'zbrinjavanja i oporavka, da pomognu promovisanju i unapređenju sistema '
                      'dečije zdravstvene zaštite, da pruže svaki vid pomoći i podrške onima'
                      ' kojima je to potrebno. Godišnje u našoj zemlji od maligne bolesti '
                      'oboli oko 330 dece. Strah, nemoć, a na kraju i smrt- to je sudbina '
                      'svakog 7. og obolelog deteta u Republici Srbiji. Ekstremno siromaštvo '
                      'u Srbiji podrazumeva da čovek nema ni za hleb i taj vid siromaštva još '
                      'uvek nije iskorenjen.',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 24.0),
                  Text(
                    'Socijalna davanja',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Ekstremno siromaštvo u Srbiji podrazumeva da čovek nema ni za hleb i '
                    'taj vid siromaštva još uvek nije iskorenjen.'
                    'Apsolutno siromaštvo u Srbiji podrazumeva svaku osobu koja nema '
                    '12 000 din. mesečno za zadovoljenje osnovnih životnih potreba.'
                    ' Takvih je u R. Srbiji oko pola miliona stanovnika ili 7,3%.'
                    'Prema podacima UNICEF-a, 22 000 dece umre svaki dan od siromaštva, '
                    'dok je u Srbiji 400 000 dece pod rizikom od siromaštva. '
                    '268 000 stanovnika dobija neki oblik socijalne pomoći.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildTermsExpansionTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const ExpansionTile(
          title: Text(
            'Terms & Conditions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut '
                'labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit '
                'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, '
                'sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
