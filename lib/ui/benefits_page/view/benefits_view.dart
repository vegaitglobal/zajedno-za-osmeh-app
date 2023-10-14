import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail.dart';
import 'package:gu_mobile/ui/benefits_feature/mock_data.dart';
import '../../../resources/my_colors.dart';
import '../../filter_page/view/filter_view';
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterView()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 32, right: 16),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Filtriraj',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.filter_list, // Use an appropriate icon here
                        size: 18,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
}
