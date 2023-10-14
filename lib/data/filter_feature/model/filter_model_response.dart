import '../../../ui/filter_page/model/FilterUiModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_model_response.g.dart';

@JsonSerializable()
class FilterModelResponse {
  int numberOfItems;
  bool isLoadingFailed;

  FilterModelResponse({
    required this.numberOfItems,
    required this.isLoadingFailed,
  });

  factory FilterModelResponse.fromJson(Map<String, dynamic> json) =>
      _$FilterModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FilterModelResponseToJson(this);
}

extension FilterModelResponseExtension on FilterModelResponse {
  FilterUiModel toModel() => FilterUiModel(
      numberOfItems: numberOfItems, isLoadingFailed: isLoadingFailed);
}
