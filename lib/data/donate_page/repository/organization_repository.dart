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
        email: response['email'],
        phoneNumber: response['phone_number'],
        beneficiaryBankSwift: response['beneficiary_bank_swift'],
        beneficiaryBankName: response['beneficiary_bank_name'],
        beneficiaryIban: response['beneficiary_iban'],
        beneficiaryName: response['beneficiary_name'],
        beneficiaryAddress: response['beneficiary_address'],
        correspondentBankName: response['correspondent_bank_name'],
        correspondentBankSwift: response['correspondent_bank_swift'],
        ipsQrUrl: response['ips_qr_url']);

    return organizationUIModel;
  }
}
