import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/benefits_feature/components/carousel_card.dart';
import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';
import 'package:gu_mobile/ui/common/custom_appbar.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';
import 'package:gu_mobile/ui/home_page/view/link_card.dart';

import '../../benefits_feature/bloc/benefits_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BenefitModel> benefitsData = [];

  @override
  void initState() {
    context.read<BenefitsBloc>().add(const FetchBenefitsData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    Positioned(
                      top: 55,
                      child: Container(
                        width: 166,
                        height: 12,
                        color: AppColors.blueHighlight,
                      ),
                    ),
                    const Text(
                      'Male stvari donose\nveliku radost.',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    Positioned(
                      top: 55,
                      left: 146,
                      child: Container(
                        width: 166,
                        height: 12,
                        color: AppColors.blueHighlight,
                      ),
                    ),
                    const Text(
                      'Hajde da činimo velike\nstvari kroz male doprinose.',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Najnovije usluge',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: BlocBuilder<BenefitsBloc, BenefitsState>(
                  builder: (context, state) {
                    return switch (state) {
                      BenefitsLoadingState() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      BenefitsFailState() => const Center(
                          child: Text('Failed'),
                        ),
                      BenefitsSuccessState() => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.benefits
                                .map((data) => Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CarouselCard(benefitData: data),
                                    ))
                                .toList(),
                          ),
                        ),
                      BenefitsState() =>
                        const Center(child: CircularProgressIndicator()),
                    };
                  },
                ),
              ),
              const LinkCard(
                image: 'assets/images/graphics/home_graphic_1.png',
                title: 'Proverite sve povlašćene\nusluge',
                buttonText: 'Proveri',
                goTo: AppRoutes.benefits,
                align: CrossAxisAlignment.start,
              ),
              const LinkCard(
                image: 'assets/images/graphics/home_graphic_2.png',
                title: 'Naša fondacija\nZajedno za osmeh',
                buttonText: 'O nama',
                goTo: AppRoutes.aboutUs,
                align: CrossAxisAlignment.start,
              ),
              const LinkCard(
                image: 'assets/images/graphics/home_graphic_3.png',
                title: 'Pogledajte kako i Vi možete da\nučestvujete',
                buttonText: 'Proveri',
                goTo: AppRoutes.donate,
                align: CrossAxisAlignment.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
