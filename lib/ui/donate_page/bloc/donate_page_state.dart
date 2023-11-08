part of 'donate_page_bloc.dart';

sealed class DonatePageState extends Equatable {
  const DonatePageState(this.organization);

  final OrganizationUIModel organization;

  @override
  List<Object> get props => [];
}

class DonatePageInitialState extends DonatePageState {
  const DonatePageInitialState(super.organization);
}

final class DonatePageSuccessState extends DonatePageState {
  const DonatePageSuccessState(super.organization);
}

final class DonatePageFailureState extends DonatePageState {
  const DonatePageFailureState(super.organization);
}
