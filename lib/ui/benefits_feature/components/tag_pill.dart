import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class TagPill extends StatelessWidget {
  final String text;

  const TagPill({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: AppColors.grayBlueLight,
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: AppColors.royalBlue),
      ),
    );
  }
}
