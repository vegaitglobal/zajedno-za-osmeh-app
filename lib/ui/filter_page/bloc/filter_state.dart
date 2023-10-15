part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

final class FilterInitialState extends FilterState {
  const FilterInitialState();
}

final class FilterSuccessState extends FilterState {
  const FilterSuccessState(this.items);

  final List<FilterUiModel> items;

  @override
  List<Object> get props => [items];
}

final class FilterFailState extends FilterState {
  const FilterFailState();
}
