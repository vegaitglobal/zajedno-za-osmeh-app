import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/profile/repository/donee_repository.dart';
import 'package:gu_mobile/ui/profile_page/bloc/donee_event.dart';
import 'package:gu_mobile/ui/profile_page/bloc/profile_state.dart';

class ProfileBloc extends Bloc<DoneeEvent, ProfileState> {
  ProfileBloc({required ProfileRepository repository})
      : super(const ProfileInitialState()) {
    on<DeleteDonee>((event, emit) async {
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
