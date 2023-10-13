import 'package:gu_mobile/data/example_feature/model/example_model_response.dart';
import 'package:gu_mobile/domain/example_feature/example_repository.dart';
import 'package:gu_mobile/data/example_feature/service/example_api_service.dart';
import 'package:gu_mobile/domain/example_feature/model/example_model.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleApiService _apiService;

  ExampleRepositoryImpl(this._apiService);

  @override
  Future<ExampleModel> getExampleCall() async {
    final response = await _apiService.getResponse();
    return response.toModel();
  }
}
