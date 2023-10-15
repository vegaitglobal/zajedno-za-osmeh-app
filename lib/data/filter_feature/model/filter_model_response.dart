import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FilterModelResponse {
  int id;
  DateTime createdAt;
  String name;
  String iconName;

  FilterModelResponse({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.iconName
  });
}
