import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail.dart';
import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

class BenefitDetailView extends StatelessWidget {
  final BenefitModel benefitData;

  BenefitDetailView({required this.benefitData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: GestureDetector(
          onTap: () => context.go(AppRoutes.home.path()),
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Image.asset('assets/images/icons/arrow.png'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Nazad',
                  style: TextStyle(fontSize: 14, color: AppColors.royalBlue),
                )
              ],
            ),
          ),
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
