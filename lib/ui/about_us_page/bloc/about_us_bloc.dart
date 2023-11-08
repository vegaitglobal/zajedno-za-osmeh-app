import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/about_us_page/repository/team_members_repository.dart';
import 'package:gu_mobile/ui/about_us_page/bloc/about_us_event.dart';
import 'package:gu_mobile/ui/about_us_page/bloc/about_us_state.dart';
import 'package:gu_mobile/ui/about_us_page/model/team_members_ui_model.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc({required TeamMembersRepository repository})
      : super(const AboutUsInitialState([])) {
    on<AboutUsFetchTeamMembers>((event, emit) async {
      if (state.teamMembers.isEmpty) {
        try {
          List<TeamMembersUIModel> items = await repository.getAll();
          emit(AboutUsSuccessState(items));
        } catch (e) {
          emit(const AboutUsFailureState([]));
        }
      }
    });
  }
}
