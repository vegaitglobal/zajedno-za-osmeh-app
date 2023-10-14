import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/about_us_feature/view/team_member.dart';

class OurTeamOverview extends StatelessWidget {
  const OurTeamOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc with Streams')),
      body: Container(
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
                  SizedBox(height: 20,),
                  Container(
                    height: 212 * 3 - 117,
                    child: GridView.count(
                      primary: false,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        TeamMember(),
                        TeamMember(),
                        TeamMember(),
                        TeamMember(),
                        TeamMember(),
                        TeamMember(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
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
