import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/about_us_feature/view/team_member_with_image.dart';
import 'package:gu_mobile/ui/about_us_feature/view/team_member_without_image.dart';

class OurTeamOverview extends StatelessWidget {
  const OurTeamOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc with Streams')),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: Colors.white),
          child: ExpansionTile(
            title: Text(
              'Naš tim',
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF01295f),
                  fontWeight: FontWeight.w500),
            ),
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fondacija „Zajedno za osmeh“ osnovana je sa ciljem da spozna sve tekuće probleme pojedinca, porodice ili zajednice sa kojima se susreću i pruži svaki vid podrške koji je neophodan.',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 202 * 3,
                      child: GridView.count(
                        primary: false,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage()
                        ],
                      ),
                    ),
                    Container(
                      height: 50 * 5,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20,);
                        },
                        itemBuilder: (context, index) {
                          return TeamMemberWithoutImage();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Start',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
