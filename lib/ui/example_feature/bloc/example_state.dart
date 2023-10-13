part of 'example_bloc.dart';

sealed class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object> get props => [];
}

final class ExampleInitialState extends ExampleState {}

final class ExampleSuccessState extends ExampleState {
  const ExampleSuccessState(this.item);

  final ExampleModel item;

  @override
  List<Object> get props => [item];
}

final class ExampleFailState extends ExampleState {
  const ExampleFailState();
}
