import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OrganizationModelResponse {
  int id;
  String createdAt;
  String account;
  String accessFileUrl;
  String correspondent;
  String accWithInstitution;
  String beneficiary;
  String email;
  String phoneNumber;

  OrganizationModelResponse({
    required this.id,
    required this.createdAt,
    required this.account,
    required this.accessFileUrl,
    required this.correspondent,
    required this.accWithInstitution,
    required this.beneficiary,
    required this.email,
    required this.phoneNumber,
  });
}
