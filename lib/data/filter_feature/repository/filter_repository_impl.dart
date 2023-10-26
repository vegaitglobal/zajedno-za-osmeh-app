import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/data/filter_feature/model/filter_model_response.dart';

import '../../../ui/filter_page/model/FilterUiModel.dart';

class FilterRepository {
  FilterRepository();

  Future<List<FilterUiModel>> getAll() async {
    final response = await supabaseClient.from('Category').select();
    List<FilterUiModel> filters = response
        .map<FilterUiModel>(
          (category) => FilterUiModel(
            id: category['id'],
            createdAt: category['created_at'],
            name: category['name'],
            icon: category['icon_name'],
          ),
        )
        .toList();
    return filters;
  }

  Future<List<FilterByCityModelResponse>> getAllCities() async {
    Set<String> uniqueCities = <String>{};
    final response = await supabaseClient.from('Donor').select('city');

    for (var i = 0; i < response.length; i++) {
      final city = response[i]['city'].toString().trim();
      if (city.isNotEmpty) {
        uniqueCities.add(city);
      }
    }

    List<FilterByCityModelResponse> uniqueCityList = uniqueCities
        .map<FilterByCityModelResponse>(
            (city) => FilterByCityModelResponse(city: city))
        .toList();

    return uniqueCityList;
  }
}
