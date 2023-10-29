import 'package:gu_mobile/data/core/supabase/supabase_client.dart';

class ProfileRepository {
  ProfileRepository();

  Future<void> deleteAccount() async {
    await supabaseClient.rpc('delete_user');
  }
}
