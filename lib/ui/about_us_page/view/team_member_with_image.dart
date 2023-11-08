import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gu_mobile/ui/about_us_page/model/team_members_ui_model.dart';

class TeamMemberWithImage extends StatelessWidget {
  const TeamMemberWithImage({super.key, required this.teamMember});

  final TeamMembersUIModel teamMember;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
            width: 158,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: teamMember.profileImageUrl!,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 0, height: 10),
          Text(
            teamMember.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(
            width: 148,
            child: Text(
              teamMember.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.grayBlue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
