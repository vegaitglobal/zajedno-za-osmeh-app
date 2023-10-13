part of 'coins_bloc.dart';

sealed class CoinsEvent extends Equatable {
  const CoinsEvent();

  @override
  List<Object> get props => [];
}

final class CoinsFetchData extends CoinsEvent {
  const CoinsFetchData();
}

final class CoinsObserveData extends CoinsEvent {
  const CoinsObserveData(this.items);

  final List<CoinModel> items;

  @override
  List<Object> get props => [items];
}
