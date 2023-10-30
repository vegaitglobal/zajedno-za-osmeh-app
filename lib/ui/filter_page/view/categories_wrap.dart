import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/resources/my_colors.dart';
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
        final isSelected =
            selectedCategories.map((e) => e.id).contains(category.id);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
          child: InkWell(
            onTap: () {
              onPress();
              if (isSelected) {
                context
                    .read<BenefitsBloc>()
                    .add(RemoveCategoryFilter(category));
              } else {
                context.read<BenefitsBloc>().add(AddCategoryFilter(category));
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(133, 0, 0, 0),
                  width: 1,
                ),
                color: isSelected ? AppColors.royalBlue : Colors.transparent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    MdiIcons.fromString(category.icon),
                    color: AppColors.primaryOrange,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList()
    ]);
  }
}
