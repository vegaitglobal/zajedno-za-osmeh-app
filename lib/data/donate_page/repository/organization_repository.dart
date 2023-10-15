import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/ui/donate_page/model/organization_ui_model.dart';

class OrganizationRepository {
  OrganizationRepository();

  Future<OrganizationUIModel> get() async {
    Map<String, dynamic> response =
        await supabaseClient.from('Organization').select().single();

    OrganizationUIModel organizationUIModel = OrganizationUIModel(
      id: response['id'],
      createdAt: response['created_at'],
      account: response['account'],
      accessFileUrl: response['access_file_url'],
      correspondent: 'TODO: Change',
      accWithInstitution: 'TODO: Change',
      beneficiary: 'TODO: Change',
      email: response['email'],
      phoneNumber: response['phone_number'],
    );

    return organizationUIModel;
  }
}
