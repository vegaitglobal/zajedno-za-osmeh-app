import 'package:flutter/material.dart';
import 'package:gu_mobile/common/left_arrow_back_button.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/about_us_page/view/our_team_overview.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
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
      appBar: AppBar(title: const Text(' ')),
      body: ListView(children: <Widget>[
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
        _buildOurTeamExpansionTile(),
      ]),
    );
  }

  Widget _buildOurTeamExpansionTile() {
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
            'Naš tim',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            OurTeamOverview(),
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
                      ), //space between bullet and text
                      Expanded(
                        child: Text(
                          strone,
                          style: const TextStyle(fontSize: 16),
                        ), //text
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
                'Ko smo mi',
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
              ]),
        ));
  }
}
