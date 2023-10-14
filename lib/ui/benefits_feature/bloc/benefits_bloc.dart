import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';

import '../../../data/benefits_feature/repository/benefits_repository.dart';
import '../model/benefit_model.dart';

part 'benefits_event.dart';
part 'benefits_state.dart';

class BenefitsBloc extends Bloc<BenefitsEvent, BenefitsState> {
  BenefitsBloc({required BenefitsRepo repository})
      : super(const BenefitsInitial()) {
    on<FetchBenefitsData>((event, emit) async {
      print('fetch');
      emit(const BenefitsLoadingState());
      try {
        List<BenefitModel> benefitsData = await repository.getBenefits();
        print(benefitsData);
        emit(BenefitsSuccessState(benefitsData));
      } catch (error) {
        print(error.toString());
        emit(const BenefitsFailState());
      }
    });
  }
}
