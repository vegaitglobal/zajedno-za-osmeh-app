sealed class DoneeEvent {
  const DoneeEvent();
}

final class DeleteDonee extends DoneeEvent {
  final String doneeId;
  const DeleteDonee({required this.doneeId});
}
