import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class QRVerificationUiModel {
  bool isValid;
  QRVerificationUiModel({required this.isValid});
}