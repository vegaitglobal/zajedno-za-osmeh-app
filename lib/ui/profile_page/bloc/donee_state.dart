import 'package:equatable/equatable.dart';

sealed class DoneeState extends Equatable {
  const DoneeState();

  @override
  List<Object> get props => [];
}

final class DoneeInitialState extends DoneeState {
  const DoneeInitialState();
}

final class DoneeSuccessState extends DoneeState {
  const DoneeSuccessState();
}

final class DoneeFailureState extends DoneeState {
  const DoneeFailureState();
}
