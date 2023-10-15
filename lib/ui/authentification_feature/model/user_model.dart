import 'dart:io';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final File medicalRecord;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.medicalRecord,
  });
}
