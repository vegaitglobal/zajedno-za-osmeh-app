import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/donee/repository/donee_repository.dart';
import 'package:gu_mobile/ui/profile_page/bloc/donee_event.dart';
import 'package:gu_mobile/ui/profile_page/bloc/donee_state.dart';

class DoneeBloc extends Bloc<DoneeEvent, DoneeState> {
  DoneeBloc({required DoneeRepository repository})
      : super(const DoneeInitialState()) {
    on<DeleteDonee>((event, emit) async {
      try {
        await repository.deleteDonee(event.doneeId);

        emit(const DoneeSuccessState());
      } catch (e) {
        print('error: $e');
        emit(const DoneeFailureState());
      }
    });
  }
}
