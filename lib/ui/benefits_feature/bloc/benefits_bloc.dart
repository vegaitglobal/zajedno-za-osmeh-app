import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';
import 'package:gu_mobile/data/filter_feature/repository/filter_repository_impl.dart';
import 'package:gu_mobile/ui/filter_page/model/FilterUiModel.dart';
import '../model/benefit_model.dart';

part 'benefits_event.dart';

part 'benefits_state.dart';

class BenefitsBloc extends Bloc<BenefitsEvent, BenefitsState> {
  BenefitsBloc({
    required BenefitsRepo benefitsRepository,
    required FilterRepository filterRepository,
  }) : super(const BenefitsInitial([], [], [])) {
    on<FetchBenefitsData>((event, emit) async {
      emit(
        BenefitsLoadingState(
          state.benefits,
          state.categories,
          state.selectedCategories,
        ),
      );
      try {
        List<BenefitModel> benefitsData =
            await benefitsRepository.getBenefits();
        List<FilterUiModel> categories = await filterRepository.getAll();

        emit(BenefitsSuccessState(
            benefitsData, categories, state.selectedCategories));
      } catch (error) {
        emit(BenefitsFailState(
            state.benefits, state.categories, state.selectedCategories));
      }
    });

    on<AddCategoryFilter>((event, emit) async {
      emit(BenefitsLoadingState(
          state.benefits, state.categories, state.selectedCategories));
      try {
        List<FilterUiModel> newSelectedCategories =
            [...state.selectedCategories, event.category].toList();

        List<BenefitModel> filteredBenefits = state.benefits
            .where((element) => newSelectedCategories
                .map((e) => e.name)
                .contains(element.categoryName))
            .toList();

        emit(BenefitsSuccessState(
            filteredBenefits, state.categories, newSelectedCategories));
      } catch (error) {
        emit(BenefitsFailState(
            state.benefits, state.categories, state.selectedCategories));
      }
    });
  }
}
