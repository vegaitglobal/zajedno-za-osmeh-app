import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FilterUiModel {
  int numberOfItems;
  bool isLoadingFailed;

  FilterUiModel({required this.numberOfItems, required this.isLoadingFailed});

  factory FilterUiModel.fromDataList(List<Map<String, dynamic>> dataList) {
    int numberOfItems = dataList.length;
    bool isLoadingFailed = false;

    return FilterUiModel(
      numberOfItems: numberOfItems,
      isLoadingFailed: isLoadingFailed,
    );
  }
}
