part of 'donate_page_bloc.dart';

sealed class DonatePageEvent {
  const DonatePageEvent();
}

final class DonatePageFetchOrganization extends DonatePageEvent {
  const DonatePageFetchOrganization();
}
