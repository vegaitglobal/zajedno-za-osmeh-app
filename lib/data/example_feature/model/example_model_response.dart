import 'package:gu_mobile/domain/example_feature/model/example_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_model_response.g.dart';

@JsonSerializable()
class ExampleModelResponse {
  String name;

  ExampleModelResponse({required this.name});

  factory ExampleModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleModelResponseToJson(this);
}

extension ExampleModelResponseExtension on ExampleModelResponse {
  ExampleModel toModel() => ExampleModel(id: 1, name: name);
}
