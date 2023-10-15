import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail.dart';
import '../../../resources/my_colors.dart';
import '../../benefits_feature/bloc/benefits_bloc.dart';
import '../../filter_page/filter_view';
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
              child: const Padding(
                padding: EdgeInsets.only(top: 32, right: 16),
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
              child: BlocBuilder<BenefitsBloc, BenefitsState>(
                builder: (context, state) {
                  return switch (state) {
                    BenefitsLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    BenefitsFailState() => const Center(
                        child: Text('Failed'),
                      ),
                    BenefitsSuccessState() => ListView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: state.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BenefitDetailsCard(
                            benefitData: state.data[index],
                            showAllServices: true,
                          );
                        }),
                    BenefitsState() =>
                      const Center(child: CircularProgressIndicator()),
                  };
                },
              ),
            )
          ]),
        ));
  }
}
