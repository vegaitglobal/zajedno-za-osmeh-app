import 'package:flutter/material.dart';

class BenefitDetailView extends StatelessWidget {
  final String benefitId;

  BenefitDetailView({ required this.benefitId,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Center(child: Text('Benefit Detail '  + benefitId),),);
  }
}
