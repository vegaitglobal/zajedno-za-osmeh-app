import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/benefits_feature/components/benefit_detail_card.dart';
import '../../../resources/my_colors.dart';
import '../../benefits_feature/bloc/benefits_bloc.dart';
import '../../common/custom_appbar.dart';
import '../../common/custom_bottom_navigation_bar.dart';

class BenefitsView extends StatelessWidget {
  const BenefitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F5FA),
        appBar: const CustomAppBar(),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: GestureDetector(
                onTap: () {
                  context.go(AppRoutes.filters.path());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Filtriraj',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset("assets/icons/filter_icon.svg")
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                        itemCount: state.filteredBenefits.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BenefitDetailsCard(
                            benefitData: state.filteredBenefits[index],
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
