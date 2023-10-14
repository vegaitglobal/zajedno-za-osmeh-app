import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/ui/about_us_page/model/team_members_ui_model.dart';

class TeamMembersRepository {
  TeamMembersRepository();

  Future<List<TeamMembersUIModel>> getAll() async {
    final response = await supabaseClient.from('TeamMembers').select();
    List<TeamMembersUIModel> teamMembers = response
        .map<TeamMembersUIModel>(
          (teamMember) => TeamMembersUIModel(
            id: teamMember['id'],
            name: teamMember['name'],
            createdAt: teamMember['created_at'],
            title: teamMember['title'],
            profileImageUrl: teamMember['profile_image_url'] ?? '',
          ),
        )
        .toList();
    return teamMembers;
  }
}
