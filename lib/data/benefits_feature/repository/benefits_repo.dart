import 'package:gu_mobile/ui/benefits_feature/model/benefit_model.dart';

abstract class BenefitsRepo {
  Future<List<BenefitModel>> getBenefits();
}
