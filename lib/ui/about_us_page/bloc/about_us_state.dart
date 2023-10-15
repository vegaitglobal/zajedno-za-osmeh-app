import 'package:equatable/equatable.dart';
import 'package:gu_mobile/ui/about_us_page/model/team_members_ui_model.dart';

sealed class AboutUsState extends Equatable {
  const AboutUsState();

  @override
  List<Object> get props => [];
}

final class AboutUsInitialState extends AboutUsState {
  const AboutUsInitialState();
}

final class AboutUsSuccessState extends AboutUsState {
  const AboutUsSuccessState(this.teamMembers);

  final List<TeamMembersUIModel> teamMembers;

  @override
  List<Object> get props => [teamMembers];
}

final class AboutUsFailureState extends AboutUsState {
  const AboutUsFailureState();
}
