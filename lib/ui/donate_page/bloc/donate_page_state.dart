part of 'donate_page_bloc.dart';

sealed class DonatePageState extends Equatable {
  const DonatePageState();

  @override
  List<Object> get props => [];
}

class DonatePageInitialState extends DonatePageState {
  const DonatePageInitialState();
}

final class DonatePageSuccessState extends DonatePageState {
  const DonatePageSuccessState(this.organization);

  final OrganizationUIModel organization;

  @override
  List<Object> get props => [organization];
}

final class DonatePageFailureState extends DonatePageState {
  const DonatePageFailureState();
}
