
import 'package:gu_mobile/domain/example_feature/model/example_model.dart';

abstract class ExampleRepository {
  Future<ExampleModel> getExampleCall();
}