import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/qr_verification_page/repository/qr_code_status_repository.dart';
import 'package:gu_mobile/ui/qr_verification_page/bloc/qr_verification_event.dart';
import 'package:gu_mobile/ui/qr_verification_page/bloc/qr_verification_state.dart';
import 'package:gu_mobile/ui/qr_verification_page/model/qr_code_status_ui_model.dart';

class QRVerificationBloc
    extends Bloc<QRVerificationEvent, QRVerificationState> {
  QRVerificationBloc({required QRCodeStatusRepository repository})
      : super(const QRVerificationInitialState()) {
    on<QRVerificatioFetchQRStatus>((event, emit) async {
      try {
        QRCodeStatusUIModel item = await repository.get(event.doneeId);
        emit(QRVerificationSuccessState(item));
      } catch (e) {
        emit(const QRVerificationFailureState());
      }
    });
  }
}
