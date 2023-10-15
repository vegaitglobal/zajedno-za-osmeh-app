import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/ui/qr_verification_page/model/qr_code_status_ui_model.dart';

class QRCodeStatusRepository {
  QRCodeStatusRepository();

  Future<QRCodeStatusUIModel> get(String doneeExtrnalId) async {
    final response = await supabaseClient.from('Donee').select().filter('extrnal_id', 'eq', doneeExtrnalId);
    QRCodeStatusUIModel qrStatus = response
        .map<QRCodeStatusUIModel>(
          (teamMember) => QRCodeStatusUIModel(
        isValid: teamMember['is_verified'],
      ),
    ).toList().first;
    return qrStatus;
  }
}