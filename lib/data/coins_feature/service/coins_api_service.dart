import 'package:gu_mobile/data/coins_feature/model/coins_response.dart';
import 'package:gu_mobile/data/core/dio_service.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'coins_api_service.g.dart';

@RestApi()
abstract class CoinsApiService {
  factory CoinsApiService(DioService dioService) {
    final dio = dioService.dio;
    return _CoinsApiService(dio);
  }

  @GET("coins/markets")
  Future<List<CoinsResponse>> fetchCoins(
    @Query("per_page") int perPage,
    @Query("page") int page,
    @Query("locale") String locale,
    @Query("vs_currency") String currency,
  );
}
