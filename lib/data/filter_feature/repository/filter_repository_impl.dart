import 'package:flutter/material.dart';
import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import '../../../ui/filter_page/model/FilterUiModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterRepository {

  Future<List<FilterUiModel>> getFiltersCall() async {
    final response = await supabaseClient.from('Category').select();
    List<FilterUiModel> filters = response
      .map<FilterUiModel>(
        (category) => FilterUiModel(
          id: category['id'], 
          createdAt: category['created_at'],
          name: category['name'],
          icon: category['icon_name'],
        ),
      ).toList();
      return filters;
  }
}