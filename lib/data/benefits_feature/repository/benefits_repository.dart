import 'package:gu_mobile/data/benefits_feature/model/benefits_model_response.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';
import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';

class BenefitsRepository implements BenefitsRepo {
  @override
  Future<List<BenefitModelResponse>> getBenefits() async {
    List<BenefitModelResponse> fetchedData = [];
    try {
      final response = await supabaseClient.from('Donor').select(
          'id, name, address, city, icon_url, website_url, company_image, Benefit(id, included_benefits)');
      for (var i = 0; i < response.length; i++) {
        fetchedData.add(
          BenefitModelResponse(
            title: response[i]['name'],
            address: response[i]['address'],
            city: response[i]['city'],
            websiteUrl: response[i]['website_url'],
            coverImgUrl: response[i]['company_image'],
            logoImgUrl: response[i]['icon_url'],
            services: [], // TODO: do services
            tags: [], // TODO: do tags
          ),
        );
      }
    } catch (error) {
      print(error);
    }
    return fetchedData;
  }
}
