import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TeamMembersUIModel {
  int id;
  String createdAt;
  String name;
  String title;
  String? profileImageUrl;

  TeamMembersUIModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.title,
    this.profileImageUrl,
  });
}
