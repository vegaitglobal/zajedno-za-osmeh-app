import 'package:dio/dio.dart';
import 'package:gu_mobile/data/core/token/HeadersConfig.dart';
import 'package:gu_mobile/data/core/token/token_manager.dart';

class TokenInterceptor extends Interceptor {
  final TokenManager _tokenManager;

  TokenInterceptor(this._tokenManager);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokenManager.getToken();

    if (token != null) {
      options.headers[HeadersConfig.authorizationKey] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: Example if we have refresh token:
    // if (err.response?.statusCode == 401) {
    //    // Refresh token
    //     await _tokenManager.refreshAccessToken();
    //
    //    // Retry the request with the updated token
    //    final requestOptions = err.requestOptions;
    //    final refreshedAuthToken = _tokenManager.getToken();
    //
    //    if (refreshedAuthToken != null) {
    //      requestOptions.headers[HeadersConfig.authorizationKey] = 'Bearer $refreshedAuthToken';
    //      handler.resolve(await err.request.retryRequest(requestOptions));
    //      return;
    //    }
    //  }

    super.onError(err, handler);
  }
}
