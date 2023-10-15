part of 'benefits_bloc.dart';

sealed class BenefitsState extends Equatable {
  const BenefitsState();

  @override
  List<Object> get props => [];
}

final class BenefitsInitial extends BenefitsState {
  const BenefitsInitial();
}

final class BenefitsSuccessState extends BenefitsState {
  const BenefitsSuccessState(this.data);

  final List<BenefitModel> data;

  @override
  List<Object> get props => [data];
}

final class BenefitsFailState extends BenefitsState {
  const BenefitsFailState();
}

final class BenefitsLoadingState extends BenefitsState {
  const BenefitsLoadingState();
}
