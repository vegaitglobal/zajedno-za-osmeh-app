
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ExampleUiModel {
  int numberOfItems;
  bool isLoadingFailed;
  ExampleUiModel({required this.numberOfItems, required this.isLoadingFailed});
}
