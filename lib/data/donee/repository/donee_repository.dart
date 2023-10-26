import 'package:gu_mobile/data/core/supabase/supabase_client.dart';

class DoneeRepository {
  DoneeRepository();

  Future<void> deleteDonee(String id) async {
    final response = await supabaseClient
        .from('Donee')
        .delete()
        .eq('id', "f60f0df6-df9d-4f6a-a124-9ec994ad07e8");

    if (response != null) {
      print('Failed to delete Donee: $response');
      throw Exception('Failed to delete Donee');
    }
  }
}
