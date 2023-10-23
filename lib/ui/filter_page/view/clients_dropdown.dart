import 'package:flutter/material.dart';
import 'package:gu_mobile/data/filter_feature/model/filter_model_response.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class ClientsDropdown extends StatelessWidget {
  const ClientsDropdown({
    super.key,
    required this.selectedCity,
    required this.cities,
  });

  final String selectedCity;
  final List<FilterByCityModelResponse> cities;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayBlue, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 12, bottom: 2),
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedCity.isNotEmpty ? selectedCity : null,
          items: [
            const DropdownMenuItem<String>(
              value: null,
              child: Text("Prikaži sve"),
            ),
            ...cities.map((item) {
              return DropdownMenuItem<String>(
                key: UniqueKey(),
                value: item.city,
                child: Text(item.city),
              );
            }).toList(),
          ],
          onChanged: (newValue) {
            // setState(() {
            //   selectedCity = newValue;
            // });
            print(newValue);
          },
          underline: Container(
            height: 0,
          ),
        ),
      ),
    );
  }
}
