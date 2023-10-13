import 'package:dio/dio.dart';
import 'package:gu_mobile/data/core/token/TokenInterceptor.dart';
import 'package:gu_mobile/data/core/token/token_manager.dart';

class DioService {
  late Dio _dio;

  DioService({required String baseUrl, required TokenManager tokenManager}) {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);

    _dio = Dio(options);

    _dio.interceptors.addAll([
      TokenInterceptor(tokenManager),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
  }

  Dio get dio => _dio;
}
