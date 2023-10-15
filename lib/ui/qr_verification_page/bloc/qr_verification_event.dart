sealed class QRVerificationEvent {
  const QRVerificationEvent();
}

final class QRVerificatioFetchQRStatus extends QRVerificationEvent {
  final String doneeId;
const QRVerificatioFetchQRStatus({required this.doneeId});
}
