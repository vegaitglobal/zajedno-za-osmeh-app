part of 'benefits_bloc.dart';

sealed class BenefitsEvent extends Equatable {
  const BenefitsEvent();

  @override
  List<Object> get props => [];
}

final class FetchBenefitsData extends BenefitsEvent {
  const FetchBenefitsData();
}
