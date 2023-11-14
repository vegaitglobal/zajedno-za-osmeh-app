import 'package:flutter/material.dart';
import 'package:gu_mobile/common/left_arrow_back_button.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail_card.dart';
import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

class BenefitDetailView extends StatelessWidget {
  final BenefitModel benefitData;

  const BenefitDetailView({required this.benefitData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: LeftArrowBackButton(),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Center(
        child: BenefitDetailsCard(
          benefitData: benefitData,
          showAllServices: true,
        ),
      ),
    );
  }
}
