import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/data/donate_page/repository/organization_repository.dart';
import 'package:gu_mobile/ui/donate_page/model/organization_ui_model.dart';

part 'donate_page_event.dart';

part 'donate_page_state.dart';

final emptyOrganization = OrganizationUIModel(
  id: 0,
  createdAt: '',
  account: '',
  accessFileUrl: '',
  email: '',
  phoneNumber: '',
  beneficiaryBankSwift: '',
  beneficiaryBankName: '',
  beneficiaryIban: '',
  beneficiaryName: '',
  beneficiaryAddress: '',
  correspondentBankName: '',
  correspondentBankSwift: '',
  ipsQrUrl: '',
);

class DonatePageBloc extends Bloc<DonatePageEvent, DonatePageState> {
  DonatePageBloc({required OrganizationRepository repository})
      : super(DonatePageInitialState(emptyOrganization)) {
    on<DonatePageFetchOrganization>((event, emit) async {
      if (state.organization == emptyOrganization) {
        try {
          OrganizationUIModel organization = await repository.get();
          emit(DonatePageSuccessState(organization));
        } catch (e) {
          emit(DonatePageFailureState(emptyOrganization));
        }
      }
    });
  }
}
