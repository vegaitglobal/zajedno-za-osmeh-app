import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:gu_mobile/data/core/supabase/supabase_client.dart';

import '../model/filter_model_response.dart';
import '../../../ui/filter_page/model/FilterUiModel.dart';

class FilterRepository {

  @override
  Future<FilterUiModel> getFiltersCall() async {
    final response = await supabaseClient.from("Category").select();
    List<Map<String, dynamic>> dataList = response.data as List<Map<String, dynamic>>;
    for(int i = 0; i < dataList.length; i++) {
        debugPrint(dataList[i].toString());
    }
    return FilterUiModel.fromDataList(dataList);
  }
  
}