import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/benefits_feature/components/carousel_card.dart';
import 'package:gu_mobile/ui/benefits_feature/mock_data.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mockBenefitsData
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CarouselCard(benefitData: e),
                            ))
                        .toList(),
                  ),
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

class LinkCard extends StatelessWidget {
  final String image;
  final String title;
  final String buttonText;
  final AppRoutes goTo;
  final CrossAxisAlignment align;

  const LinkCard({
    required this.image,
    required this.title,
    required this.buttonText,
    required this.goTo,
    required this.align,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: align,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                      onTap: () => context.go(goTo.path()),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.white, width: 2)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
