import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/about_us_page/model/team_members_ui_model.dart';
import 'package:gu_mobile/ui/about_us_page/view/team_member_with_image.dart';
import 'package:gu_mobile/ui/about_us_page/view/team_member_without_image.dart';

class OurTeamOverview extends StatelessWidget {
  const OurTeamOverview({super.key, required this.teamMembers});

  final List<TeamMembersUIModel> teamMembers;

  @override
  Widget build(BuildContext context) {
    List<TeamMembersUIModel> teamMembersWithProfileImage = teamMembers
        .where((tm) => tm.profileImageUrl != null && tm.profileImageUrl != '')
        .toList();

    List<TeamMembersUIModel> teamMembersWithoutProfileImage = teamMembers
        .where((tm) => tm.profileImageUrl == null || tm.profileImageUrl == '')
        .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fondacija „Zajedno za osmeh“ osnovana je sa ciljem da spozna sve tekuće probleme pojedinca, porodice ili zajednice sa kojima se susreću i pruži svaki vid podrške koji je neophodan.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 230 *
                ((teamMembersWithProfileImage.length % 2 == 0)
                    ? (teamMembersWithProfileImage.length / 2)
                    : (teamMembersWithProfileImage.length / 2) + 1),
            child: Wrap(
              spacing: 10,
              alignment: WrapAlignment.spaceBetween,
              children: List<TeamMemberWithImage>.generate(
                teamMembersWithProfileImage.length,
                (index) => TeamMemberWithImage(
                  teamMember: teamMembersWithProfileImage[index],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50 * teamMembersWithoutProfileImage.length.toDouble(),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: teamMembersWithoutProfileImage.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return TeamMemberWithoutImage(
                  teamMember: teamMembersWithoutProfileImage[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
