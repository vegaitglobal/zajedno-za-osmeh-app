part of 'coins_bloc.dart';

sealed class CoinsState extends Equatable {
  const CoinsState();

  @override
  List<Object> get props => [];
}

final class CoinsInitialState extends CoinsState {}

final class CoinsSuccessState extends CoinsState {
  const CoinsSuccessState(this.items);

  final List<CoinModel> items;

  @override
  List<Object> get props => [items];
}

final class CoinsFailState extends CoinsState {
  const CoinsFailState();
}
