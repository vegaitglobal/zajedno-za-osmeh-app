import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/benefits_feature/bloc/benefits_bloc.dart';
import 'package:gu_mobile/ui/filter_page/view/categories_wrap.dart';
import 'package:gu_mobile/ui/filter_page/view/clients_dropdown.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    void goBack() {
      context.go(AppRoutes.benefits.path());
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: goBack,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Zatvori',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset("assets/images/icons/cross.png")
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Filteri',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 25),
                BlocBuilder<BenefitsBloc, BenefitsState>(
                  builder: (context, state) {
                    return switch (state) {
                      BenefitsLoadingState() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      BenefitsInitial() => const Placeholder(),
                      BenefitsSuccessState() => Column(
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 30,
                              child: Text(
                                'Kategorije',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            CategoriesWrap(
                              categories: state.categories,
                              selectedCategories: state.selectedCategories,
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: Text(
                                'Lokacija',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            ClientsDropdown(
                              selectedCity: state.selectedCity,
                              cities: state.cities,
                            ),
                          ],
                        ),
                      BenefitsFailState() => const Placeholder()
                    };
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
