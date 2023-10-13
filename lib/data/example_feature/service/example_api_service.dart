import 'package:gu_mobile/data/core/dio_service.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../model/example_model_response.dart';

part 'example_api_service.g.dart';

@RestApi()
abstract class ExampleApiService {
  factory ExampleApiService(DioService dioService) {
    final dio = dioService.dio;
    return _ExampleApiService(dio);
  }

  @GET("people/1/")
  Future<ExampleModelResponse> getResponse();
}
