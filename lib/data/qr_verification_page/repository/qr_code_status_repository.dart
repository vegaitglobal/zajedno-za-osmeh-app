import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/ui/qr_verification_page/model/qr_code_status_ui_model.dart';

class QRCodeStatusRepository {
  QRCodeStatusRepository();

  Future<QRCodeStatusUIModel> get(String doneelId) async {
    final response = await supabaseClient.from('Donee').select().filter('id', 'eq', doneelId).single();
    QRCodeStatusUIModel qrStatus = QRCodeStatusUIModel(
      isValid: response['is_verified'],
    );
    return qrStatus;
  }
}