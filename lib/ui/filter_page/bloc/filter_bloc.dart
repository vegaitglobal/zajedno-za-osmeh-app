import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/filter_feature/repository/filter_repository_impl.dart';
import '../model/FilterUiModel.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({required FilterRepository repository}) : super(const FilterInitialState()) {
    on<FilterFetchData>((event, emit) async {
      try {
        List<FilterUiModel> items = await repository.getFiltersCall();
        emit(FilterSuccessState(items));
      } catch (e) {
        emit(const FilterFailState());
      }
    });
  }
}
