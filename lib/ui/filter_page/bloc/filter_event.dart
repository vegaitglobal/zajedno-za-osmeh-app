part of 'filter_bloc.dart';

sealed class FilterEvent {
  const FilterEvent();
}

final class FilterFetchData extends FilterEvent {
  const FilterFetchData();
}
