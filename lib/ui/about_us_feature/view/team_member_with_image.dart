import 'package:flutter/material.dart';

class TeamMemberWithImage extends StatelessWidget {
  const TeamMemberWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 202,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              'https://googleflutter.com/sample_image.jpg',
            width: 144, fit: BoxFit.cover,
          ),
          SizedBox(height: 10,),
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
