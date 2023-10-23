import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/ui/benefits_feature/bloc/benefits_bloc.dart';
import 'package:gu_mobile/ui/filter_page/view/categories_wrap.dart';
import 'package:gu_mobile/ui/filter_page/view/clients_dropdown.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Filteri'),
              BlocBuilder<BenefitsBloc, BenefitsState>(
                builder: (context, state) {
                  return switch (state) {
                    BenefitsLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    BenefitsInitial() => const Placeholder(),
                    BenefitsSuccessState() => Column(
                        children: [
                          CategoriesWrap(
                            categories: state.categories,
                            selectedCategories: state.selectedCategories,
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
    );
  }
}
