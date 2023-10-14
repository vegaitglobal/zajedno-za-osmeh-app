import 'package:gu_mobile/data/example_feature/model/example_model_response.dart';


abstract class ExampleStorage {
  void save(ExampleModelResponse value);

  ExampleModelResponse? getValue();
}
