import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail.dart';
import 'package:gu_mobile/ui/benefits_feature/mock_data.dart';
import '../../../resources/my_colors.dart';

class BenefitsView extends StatelessWidget {
  const BenefitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F5FA),
        appBar: AppBar(backgroundColor: Colors.orange),
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, left: 16, right: 16),
              child: Text(
                'Besplatne ili povlašćene usluge',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.royalBlue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Filtriraj',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.royalBlue,
                      )),
                  const SizedBox(width: 8),
                  const Image(
                      image: AssetImage('assets/images/icons/filter_icon.png')),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 8),
                  itemCount: mockBenefitsData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => context.go(AppRoutes.benefitDetail.path(),
                          extra: mockBenefitsData[index]),
                      child: BenefitDetailsCard(
                        benefitData: mockBenefitsData[index],
                        showAllServices: false,
                      ),
                    );
                  }),
            )
          ]),
        ));
  }
}
