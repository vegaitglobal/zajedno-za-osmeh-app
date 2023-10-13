import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/domain/example_feature/model/example_model.dart';
import 'package:gu_mobile/domain/example_feature/use_case/example_use_case.dart';

part 'example_event.dart';

part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc({required ExampleUseCase exampleUseCase})
      : super(ExampleInitialState()) {
    on<ExampleFetchData>((event, emit) async {
      try {
        var items = await exampleUseCase.execute();
        emit(ExampleSuccessState(items));
      } catch (e) {
        emit(const ExampleFailState());
      }
    });
  }
}
