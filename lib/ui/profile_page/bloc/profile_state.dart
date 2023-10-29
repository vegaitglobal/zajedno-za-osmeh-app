import 'package:equatable/equatable.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {
  const ProfileInitialState();
}

final class ProfileDeletionSuccessState extends ProfileState {
  const ProfileDeletionSuccessState();
}

final class ProfileDeletionFailureState extends ProfileState {
  const ProfileDeletionFailureState();
}
