import 'package:gu_mobile/ui/example_feature/model/ExampleUiModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_model_response.g.dart';

@JsonSerializable()
class ExampleModelResponse {
  int numberOfItems;
  bool isLoadingFailed;

  ExampleModelResponse({
    required this.numberOfItems,
    required this.isLoadingFailed,
  });

  factory ExampleModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ExampleModelResponseToJson(this);
}

extension ExampleModelResponseExtension on ExampleModelResponse {
  ExampleUiModel toModel() => ExampleUiModel(
      numberOfItems: numberOfItems, isLoadingFailed: isLoadingFailed);
}
