import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class TeamMemberWithImage extends StatelessWidget {
  const TeamMemberWithImage({super.key});

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
              child: Image.network(
                'https://googleflutter.com/sample_image.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 0, height: 10),
          Text(
            'Goran Petrović',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(
            width: 148,
            child: Expanded(
              child: Text(
                'osnivač i predsednik Upravnog odbora Fondacije',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grayBlue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
