import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/about_us_page/view/team_member_with_image.dart';
import 'package:gu_mobile/ui/about_us_page/view/team_member_without_image.dart';

import '../../common/custom_appbar.dart';

class OurTeamOverview extends StatelessWidget {
  const OurTeamOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: Colors.white),
          child: ExpansionTile(
            title: const Text(
              'Naš tim',
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF01295f),
                  fontWeight: FontWeight.w500),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 24, left: 16, right: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fondacija „Zajedno za osmeh“ osnovana je sa ciljem da spozna sve tekuće probleme pojedinca, porodice ili zajednice sa kojima se susreću i pruži svaki vid podrške koji je neophodan.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 250 * 3,
                      child: Wrap(
                        spacing: 30,
                        runSpacing: 30,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage(),
                          TeamMemberWithImage()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50 * 5,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          return const TeamMemberWithoutImage();
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
