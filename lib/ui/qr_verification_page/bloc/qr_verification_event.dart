sealed class QRVerificationEvent {
  const QRVerificationEvent();
}

final class QRVerificatioFetchQRStatus extends QRVerificationEvent {
  final String doneeExtrnalId;
const QRVerificatioFetchQRStatus({required this.doneeExtrnalId});
}
