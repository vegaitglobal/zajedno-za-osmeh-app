import 'package:equatable/equatable.dart';
import 'package:gu_mobile/ui/qr_verification_page/model/qr_code_status_ui_model.dart';

sealed class QRVerificationState extends Equatable {
  const QRVerificationState();

  @override
  List<Object> get props => [];
}

final class QRVerificationInitialState extends QRVerificationState {
const QRVerificationInitialState();
}

final class QRVerificationSuccessState extends QRVerificationState {
const QRVerificationSuccessState(this.qrStatus);

final QRCodeStatusUIModel qrStatus;

@override
List<Object> get props => [qrStatus];
}

final class QRVerificationFailureState extends QRVerificationState {
const QRVerificationFailureState();
}