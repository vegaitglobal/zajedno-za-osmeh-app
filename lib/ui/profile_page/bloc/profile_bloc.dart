import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/profile/repository/donee_repository.dart';
import 'package:gu_mobile/ui/profile_page/bloc/profile_event.dart';
import 'package:gu_mobile/ui/profile_page/bloc/profile_state.dart';

class ProfileBloc extends Bloc<DeleteProfile, ProfileState> {
  ProfileBloc({required ProfileRepository repository})
      : super(const ProfileInitialState()) {
    on<DeleteProfile>((event, emit) async {
      try {
        await repository.deleteAccount();

        emit(const ProfileDeletionSuccessState());
      } catch (e) {
        print('error: $e');
        emit(const ProfileDeletionFailureState());
      }
    });
  }
}
