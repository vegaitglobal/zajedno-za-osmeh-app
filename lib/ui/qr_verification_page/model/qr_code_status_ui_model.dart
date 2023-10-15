import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class QRCodeStatusUIModel {
  bool isValid;

  QRCodeStatusUIModel({
    required this.isValid
  });
}