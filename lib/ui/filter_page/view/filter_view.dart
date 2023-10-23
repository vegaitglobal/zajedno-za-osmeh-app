import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/data/filter_feature/model/filter_model_response.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/benefits_feature/bloc/benefits_bloc.dart';
import 'package:gu_mobile/ui/filter_page/model/FilterUiModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterView extends StatelessWidget {
  const FilterView({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.cities,
    required this.selectedCity,
  });

  final List<FilterUiModel> categories;
  final List<FilterUiModel> selectedCategories;
  final List<FilterByCityModelResponse> cities;
  final String selectedCity;

  @override
  Widget build(BuildContext context) {
    print('cities: ${cities[5].city}');
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        bottom: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Kategorije',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(spacing: 8.0, children: [
              ...categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: FilterChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(MdiIcons.fromString(category.icon)),
                        const SizedBox(width: 4.0),
                        Text(
                          category.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.transparent,
                    selected: selectedCategories
                        .map((e) => e.id)
                        .contains(category.id),
                    onSelected: (bool value) {
                      if (value) {
                        context
                            .read<BenefitsBloc>()
                            .add(AddCategoryFilter(category));
                      } else {
                        context
                            .read<BenefitsBloc>()
                            .add(RemoveCategoryFilter(category));
                      }
                    },
                  ),
                );
              }).toList()
            ]),
            const SizedBox(height: 10),
            const Text(
              'Lokacija',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            // Container(
            //   decoration: BoxDecoration(
            //     border: Border.all(color: AppColors.grayBlue, width: 1.0),
            //     borderRadius: BorderRadius.circular(8.0),
            //     color: Colors.transparent,
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 2, left: 12, bottom: 2),
            //     child: DropdownButton<String>(
            //       isExpanded: false,
            //       value: selectedCity,
            //       items: cities.map((item) {
            //         return DropdownMenuItem<String>(
            //           value: item.city,
            //           child: Text(item.city),
            //         );
            //       }).toList(),
            //       onChanged: (newValue) {
            //         // setState(() {
            //         //   selectedCity = newValue;
            //         // });
            //         print(newValue);
            //       },
            //       underline: Container(
            //         height: 0,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
