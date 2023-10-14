part of 'example_bloc.dart';

sealed class QRVerificationState extends Equatable {
  const ExampleState();

  @override
  List<Object> get props => [];
}

final class ExampleInitialState extends ExampleState {
  const ExampleInitialState();
}

final class ExampleSuccessState extends ExampleState {
  const ExampleSuccessState(this.item);

  final QRVerificationUiModel item;

  @override
  List<Object> get props => [item];
}

final class ExampleFailState extends ExampleState {
  const ExampleFailState();
}
