import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/filter_page/model/FilterUiModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key, required this.categories});

  final List<FilterUiModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Kategorije',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Wrap(spacing: 8.0, children: [
            ...categories.map((category) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(MdiIcons.fromString(category.icon)),
                      SizedBox(width: 4.0),
                      Text(
                        category.name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.transparent,
                  onSelected: (bool value) {},
                ),
              );
            }).toList()
          ]),
          SizedBox(height: 10),
          // Text(
          //   'Lokacija',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.normal,
          //   ),
          // ),
          // SizedBox(height: 10),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(color: AppColors.grayBlue, width: 1.0),
          //     borderRadius: BorderRadius.circular(8.0),
          //     color: Colors.transparent,
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 2, left: 12, bottom: 2),
          //     child: DropdownButton<String>(
          //       isExpanded: true,
          //       value: selectedCity,
          //       items: cities.map((city) {
          //         return DropdownMenuItem<String>(
          //           value: city,
          //           child: Text(city),
          //         );
          //       }).toList(),
          //       onChanged: (newValue) {
          //         setState(() {
          //           selectedCity = newValue;
          //         });
          //       },
          //       underline: Container(
          //         height: 0,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
