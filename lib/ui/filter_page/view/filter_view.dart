import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/benefits_feature/bloc/benefits_bloc.dart';
import 'package:gu_mobile/ui/filter_page/view/categories_wrap.dart';
import 'package:gu_mobile/ui/filter_page/view/clients_dropdown.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool changesMade = false;

  @override
  Widget build(BuildContext context) {
    void goBack() {
      context.go(AppRoutes.benefits.path());
    }

    void markChangesAsMade() {
      setState(() {
        changesMade = true;
      });
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
                              height: 40,
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
                              onPress: () {
                                markChangesAsMade();
                              },
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
                              onSelect: () {
                                markChangesAsMade();
                              },
                            ),
                          ],
                        ),
                      BenefitsFailState() => const Placeholder()
                    };
                  },
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: changesMade
                      ? () {
                          goBack();
                        }
                      : null,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: changesMade
                          ? AppColors.buttonEnabled
                          : AppColors.buttonDisabled,
                    ),
                    child: const Text(
                      'Primeni',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
