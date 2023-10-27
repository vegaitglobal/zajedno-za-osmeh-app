import 'package:gu_mobile/data/core/supabase/supabase_client.dart';

class DoneeRepository {
  DoneeRepository();

  Future<void> deleteAccount() async {
    await supabaseClient.rpc('delete_user');
  }
}
