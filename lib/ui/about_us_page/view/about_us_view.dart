import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    /* var text = RichText(
      text: TextSpan(style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'Fondacija „Zajedno za osmeh“  je osnovana sa željom, '
                'grupe mladih ljudi, da svojim delovanjem pomognu unapređenje socijalne '
                'i zdravstvene zaštite dece u Republici Srbiji, da pruže podršku '
                'oboleloj deci i njihovim porodicama, u cilju lečenja, medicinskog '
                'zbrinjavanja i oporavka, da pomognu promovisanju i unapređenju sistema '
                'dečije zdravstvene zaštite, da pruže svaki vid pomoći i podrške onima'
                ' kojima je to potrebno. Godišnje u našoj zemlji od maligne bolesti '
                'oboli oko 330 dece . Strah, nemoć, a na kraju i smrt- to je sudbina '
                'svakog 7. og obolelog deteta u Republici Srbiji. Ekstremno siromaštvo '
                'u Srbiji podrazumeva da čovek nema ni za hleb i taj vid siromaštva još '
                'uvek nije iskorenjen.\n',
          ),
          TextSpan(
            text: 'Socijalna davanja\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Ekstremno siromaštvo u Srbiji podrazumeva da čovek nema ni za hleb i '
                'taj vid siromaštva još uvek nije iskorenjen.'
                'Apsolutno siromaštvo u Srbiji podrazumeva svaku osobu koja nema '
                '12 000 din. mesečno za zadovoljenje osnovnih životnih potreba.'
                ' Takvih je u R. Srbiji oko pola miliona stanovnika ili 7,3%.'
                'Prema podacima UNICEF-a, 22 000 dece umre svaki dan od siromaštva, '
                'dok je u Srbiji 400 000 dece pod rizikom od siromaštva. '
                '268 000 stanovnika dobija neki oblik socijalne pomoći.\n',
          ),
        ]
      )
    );
    */
    var text = const Text(
        'Fondacija „Zajedno za osmeh“  je osnovana sa željom, '
            'grupe mladih ljudi, da svojim delovanjem pomognu unapređenje socijalne '
            'i zdravstvene zaštite dece u Republici Srbiji, da pruže podršku '
            'oboleloj deci i njihovim porodicama, u cilju lečenja, medicinskog '
            'zbrinjavanja i oporavka, da pomognu promovisanju i unapređenju sistema '
            'dečije zdravstvene zaštite, da pruže svaki vid pomoći i podrške onima'
            ' kojima je to potrebno. Godišnje u našoj zemlji od maligne bolesti '
            'oboli oko 330 dece . Strah, nemoć, a na kraju i smrt- to je sudbina '
            'svakog 7. og obolelog deteta u Republici Srbiji. Ekstremno siromaštvo '
            'u Srbiji podrazumeva da čovek nema ni za hleb i taj vid siromaštva još '
            'uvek nije iskorenjen.\n\n'
            'Socijalna davanja\n\n'
            'Ekstremno siromaštvo u Srbiji podrazumeva da čovek nema ni za hleb i '
            'taj vid siromaštva još uvek nije iskorenjen.'
            'Apsolutno siromaštvo u Srbiji podrazumeva svaku osobu koja nema '
            '12 000 din. mesečno za zadovoljenje osnovnih životnih potreba.'
            ' Takvih je u R. Srbiji oko pola miliona stanovnika ili 7,3%.'
            'Prema podacima UNICEF-a, 22 000 dece umre svaki dan od siromaštva, '
            'dok je u Srbiji 400 000 dece pod rizikom od siromaštva. '
            '268 000 stanovnika dobija neki oblik socijalne pomoći.\n');
    List<String> ciljevi = [
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
      appBar: AppBar(title: const Text(' ')),
      body:
      ListView(
          children: <ExpandablePanel>[
            ExpandablePanel(
              header: const Text('Ko smo mi?'),
              collapsed: const Text(
                          ' ',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
              expanded: text,
            ),

            ExpandablePanel(
              header: const Text('Ciljevi fondacije'),
              collapsed: const Text(
                          ' ',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
            ),
              expanded: Container(
                        padding: EdgeInsets.all(20),
                        child: Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: ciljevi.map((strone){
                                 return Row(
                                   children:[
                                      Icon(Icons.check),
                                      SizedBox(width: 15,), //space between bullet and text
                                      Expanded(
                                      child:Text(strone, style: TextStyle( fontSize: 15),), //text
                                      )
                                  ],

                                );

                               }).toList(),

                   ),
               ),
            ),
            ExpandablePanel(
              header: const Text('Nas tim'),
              collapsed: const Text(
                ' ',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: const Text('Ovde ide tim\n'),
            ),
        ]
      ),
    );
  }
}
