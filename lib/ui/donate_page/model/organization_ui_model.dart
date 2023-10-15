import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OrganizationUIModel {
  int id;
  String createdAt;
  String account;
  String accessFileUrl;
  String email;
  String phoneNumber;
  String beneficiaryBankSwift;
  String beneficiaryBankName;
  String beneficiaryIban;
  String beneficiaryName;
  String beneficiaryAddress;
  String correspondentBankName;
  String correspondentBankSwift;

  OrganizationUIModel({
    required this.id,
    required this.createdAt,
    required this.account,
    required this.accessFileUrl,
    required this.email,
    required this.phoneNumber,
    required this.beneficiaryBankSwift,
    required this.beneficiaryBankName,
    required this.beneficiaryIban,
    required this.beneficiaryName,
    required this.beneficiaryAddress,
    required this.correspondentBankName,
    required this.correspondentBankSwift,
  });
}
