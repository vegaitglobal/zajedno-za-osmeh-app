import 'package:gu_mobile/data/benefits_feature/model/benefits_model_response.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';
import 'package:gu_mobile/data/core/supabase/supabase_client.dart';
import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';

class BenefitsRepository implements BenefitsRepo {
  @override
  Future<List<BenefitModel>> getBenefits() async {
    List<BenefitModelResponse> fetchedData = [];
    List<BenefitModel> benefitsUiData = [];
    try {
      final response = await supabaseClient.from('Benefit').select(
          'id, included_benefits, donor_id, category_id, Donor(id, name, address, city, icon_url, website_url, company_image), Category(id, name)');
      for (var i = 0; i < response.length; i++) {
        fetchedData.add(
          BenefitModelResponse(
            title: response[i]['Donor']['name'].toString().trim(),
            address: response[i]['Donor']['address'].toString().trim(),
            city: response[i]['Donor']['city'].toString().trim(),
            websiteUrl: response[i]['Donor']['website_url'].toString().trim(),
            coverImgUrl:
                response[i]['Donor']['company_image'].toString().trim(),
            logoImgUrl: response[i]['Donor']['icon_url'].toString().trim(),
            services: response[i]['included_benefits'],
            categoryName: response[i]['Category']['name'],
          ),
        );
      }

      fetchedData.forEach(
        (element) => benefitsUiData.add(element.toUiModel()),
      );
    } catch (error) {
      throw Exception();
    }
    return benefitsUiData;
  }
}
