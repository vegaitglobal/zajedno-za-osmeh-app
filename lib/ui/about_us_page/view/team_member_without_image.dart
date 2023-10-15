import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/about_us_page/model/team_members_ui_model.dart';

class TeamMemberWithoutImage extends StatelessWidget {
  const TeamMemberWithoutImage({super.key, required this.teamMember});

  final TeamMembersUIModel teamMember;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teamMember.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            teamMember.title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
