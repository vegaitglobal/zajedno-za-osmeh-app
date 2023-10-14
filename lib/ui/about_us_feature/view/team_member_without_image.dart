import 'package:flutter/material.dart';

class TeamMemberWithoutImage extends StatelessWidget {
  const TeamMemberWithoutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Goran Petrović',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            'osnivač i upravitelj Fondacije',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
