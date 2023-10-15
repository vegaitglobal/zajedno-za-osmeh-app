import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail.dart';
import 'package:gu_mobile/ui/benefits_feature/mock_data.dart';
import '../../../resources/my_colors.dart';
import '../../filter_page/view/filter_view.dart';
import '../../common/custom_appbar.dart';
import '../../common/custom_bottom_navigation_bar.dart';

class BenefitsView extends StatelessWidget {
  const BenefitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F5FA),
        appBar: CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
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
            _buildFilterExpansionTile(),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 8),
                  itemCount: mockBenefitsData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BenefitDetailsCard(
                      benefitData: mockBenefitsData[index],
                      showAllServices: true,
                    );
                  }),
            )
          ]),
        ));
  }

  Padding _buildFilterExpansionTile() {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: ExpansionTile(
              title: Text(
                'Filteri',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Image.asset("assets/images/icons/filter_icon.png"),
              children: [
                FilterView()
              ]),
        ));
  }
}
