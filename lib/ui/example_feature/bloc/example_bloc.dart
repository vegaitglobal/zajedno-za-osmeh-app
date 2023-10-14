import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/data/example_feature/repository/example_repository_impl.dart';
import 'package:gu_mobile/ui/example_feature/model/ExampleUiModel.dart';

import '../../qr_verification_page/model/qr_verification_ui_model.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc({required ExampleRepository repository}) : super(const ExampleInitialState()) {
    on<ExampleFetchData>((event, emit) async {
      try {
        ExampleUiModel items = await repository.getExampleCall();
        emit(ExampleSuccessState(items));
      } catch (e) {
        emit(const ExampleFailState());
      }
    });
  }
}
