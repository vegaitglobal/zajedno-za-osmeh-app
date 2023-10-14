import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import '../../../ui/filter_page/model/FilterUiModel.dart';

class FilterRepository {

  Future<List<FilterUiModel>> getFiltersCall() async {
    final response = await supabaseClient.from('Category').select();
    List<FilterUiModel> filters = response
      .map<FilterUiModel>(
        (category) => FilterUiModel(
          id: category['id'], 
          createdAt: category['created_at'],
          name: category['name'],
          iconName: category['icon_name'],
        ),
      ).toList();
      return filters;
  }
  
}