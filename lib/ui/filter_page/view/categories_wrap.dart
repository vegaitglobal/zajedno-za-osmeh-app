import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/ui/benefits_feature/bloc/benefits_bloc.dart';
import 'package:gu_mobile/ui/filter_page/model/FilterUiModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoriesWrap extends StatelessWidget {
  const CategoriesWrap({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onPress,
  });

  final List<FilterUiModel> categories;
  final List<FilterUiModel> selectedCategories;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8.0, children: [
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
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.transparent,
            selected: selectedCategories.map((e) => e.id).contains(category.id),
            onSelected: (bool value) {
              onPress();
              if (value) {
                context.read<BenefitsBloc>().add(AddCategoryFilter(category));
              } else {
                context
                    .read<BenefitsBloc>()
                    .add(RemoveCategoryFilter(category));
              }
            },
          ),
        );
      }).toList()
    ]);
  }
}
