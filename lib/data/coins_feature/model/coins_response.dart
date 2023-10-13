import 'package:flutter/cupertino.dart';
import 'package:gu_mobile/domain/coins_feature/model/coin_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coins_response.g.dart';

@JsonSerializable()
class CoinsResponse {
  String id;
  String symbol;
  String name;
  String? image;
  @JsonKey(name: "current_price")
  double currentPrice;

  CoinsResponse(
      {required this.id,
      required this.symbol,
      required this.name,
      this.image,
      required this.currentPrice});

  factory CoinsResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinsResponseToJson(this);
}

extension CoinsResponseExtension on CoinsResponse {
  CoinModel toDomain() => CoinModel(
      id: id,
      symbol: symbol,
      name: name,
      image: image ?? "image",
      currentPrice: currentPrice);
}
