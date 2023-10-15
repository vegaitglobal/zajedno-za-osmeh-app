import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FilterUiModel {
  int id;
  DateTime createdAt;
  String name;
  String icon;

  FilterUiModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.icon
  });
}
