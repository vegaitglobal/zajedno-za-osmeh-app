import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TeamMemberModelResponse {
  int id;
  int createdAt;
  String name;
  String title;
  String profileImageUrl;

  TeamMemberModelResponse({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.title,
    required this.profileImageUrl,
  });
}
