import 'package:gu_mobile/data/example_feature/model/example_model_response.dart';
import 'package:gu_mobile/data/example_feature/service/example_api_service.dart';
import 'package:gu_mobile/ui/example_feature/model/ExampleUiModel.dart';

class ExampleRepository {
  late final ExampleApiService _apiService;

  ExampleRepository(this._apiService);

  @override
  Future<ExampleUiModel> getExampleCall() async {
    final response = await _apiService.getResponse();
    return response.toModel();
  }
}