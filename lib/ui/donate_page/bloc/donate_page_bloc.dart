import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/data/donate_page/repository/organization_repository.dart';
import 'package:gu_mobile/ui/donate_page/model/organization_ui_model.dart';

part 'donate_page_event.dart';

part 'donate_page_state.dart';

class DonatePageBloc extends Bloc<DonatePageEvent, DonatePageState> {
  DonatePageBloc({required OrganizationRepository repository})
      : super(const DonatePageInitialState()) {
    on<DonatePageFetchOrganization>((event, emit) async {
      try {
        OrganizationUIModel organization = await repository.get();
        emit(DonatePageSuccessState(organization));
      } catch (e) {
        emit(const DonatePageFailureState());
      }
    });
  }
}
