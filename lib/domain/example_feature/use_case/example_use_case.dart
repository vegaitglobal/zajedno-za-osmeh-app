import 'package:gu_mobile/domain/example_feature/example_repository.dart';
import 'package:gu_mobile/domain/example_feature/model/example_model.dart';

class ExampleUseCase {
  final ExampleRepository _repository;

  ExampleUseCase(this._repository);

  Future<ExampleModel> execute() async {
    try {
      return _repository.getExampleCall();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
