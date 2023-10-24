import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/data/benefits_feature/repository/benefits_repo.dart';
import 'package:gu_mobile/data/filter_feature/model/filter_model_response.dart';
import 'package:gu_mobile/data/filter_feature/repository/filter_repository_impl.dart';
import 'package:gu_mobile/ui/filter_page/model/FilterUiModel.dart';
import '../model/benefit_model.dart';

part 'benefits_event.dart';

part 'benefits_state.dart';

class BenefitsBloc extends Bloc<BenefitsEvent, BenefitsState> {
  BenefitsBloc({
    required BenefitsRepo benefitsRepository,
    required FilterRepository filterRepository,
  }) : super(const BenefitsInitial([], [], [], [], [], '')) {
    on<FetchBenefitsData>((event, emit) async {
      emit(
        BenefitsLoadingState(
            state.benefits,
            state.filteredBenefits,
            state.categories,
            state.selectedCategories,
            state.cities,
            state.selectedCity),
      );
      try {
        List<BenefitModel> benefitsData =
            await benefitsRepository.getBenefits();
        List<FilterUiModel> categories = await filterRepository.getAll();

        List<FilterByCityModelResponse> cities =
            await filterRepository.getAllCities();
        emit(BenefitsSuccessState(
            benefitsData, benefitsData, categories, const [], cities, ''));
      } catch (error) {
        emit(BenefitsFailState(
          state.benefits,
          state.filteredBenefits,
          state.categories,
          state.selectedCategories,
          state.cities,
          state.selectedCity,
        ));
      }
    });

    on<AddCategoryFilter>((event, emit) async {
      emit(BenefitsLoadingState(
        state.benefits,
        state.filteredBenefits,
        state.categories,
        state.selectedCategories,
        state.cities,
        state.selectedCity,
      ));
      try {
        List<FilterUiModel> newSelectedCategories =
            [...state.selectedCategories, event.category].toList();

        List<BenefitModel> filteredBenefits;

        if (state.selectedCity.isEmpty) {
          filteredBenefits = state.benefits
              .where((element) => newSelectedCategories
                  .map((e) => e.name)
                  .contains(element.categoryName))
              .toList();
        } else {
          filteredBenefits = state.benefits
              .where((element) =>
                  newSelectedCategories
                      .map((e) => e.name)
                      .contains(element.categoryName) &&
                  element.city == state.selectedCity)
              .toList();
        }

        emit(BenefitsSuccessState(
          state.benefits,
          filteredBenefits,
          state.categories,
          newSelectedCategories,
          state.cities,
          state.selectedCity,
        ));
      } catch (error) {
        emit(BenefitsFailState(
          state.benefits,
          state.filteredBenefits,
          state.categories,
          state.selectedCategories,
          state.cities,
          state.selectedCity,
        ));
      }
    });

    on<RemoveCategoryFilter>((event, emit) async {
      emit(BenefitsLoadingState(
        state.benefits,
        state.filteredBenefits,
        state.categories,
        state.selectedCategories,
        state.cities,
        state.selectedCity,
      ));
      try {
        List<FilterUiModel> newSelectedCategories = state.selectedCategories
            .where((element) => element.id != event.category.id)
            .toList();

        List<BenefitModel> filteredBenefits = state.benefits
            .where((element) =>
                newSelectedCategories
                    .map((e) => e.name)
                    .contains(element.categoryName) &&
                element.city == state.selectedCity)
            .toList();

        emit(BenefitsSuccessState(
          state.benefits,
          filteredBenefits,
          state.categories,
          newSelectedCategories,
          state.cities,
          state.selectedCity,
        ));
      } catch (error) {
        emit(BenefitsFailState(
          state.benefits,
          state.filteredBenefits,
          state.categories,
          state.selectedCategories,
          state.cities,
          state.selectedCity,
        ));
      }
    });

    on<SelectCityFilter>((event, emit) async {
      emit(BenefitsLoadingState(
        state.benefits,
        state.filteredBenefits,
        state.categories,
        state.selectedCategories,
        state.cities,
        state.selectedCity,
      ));
      try {
        List<BenefitModel> filteredBenefits = state.benefits.where((element) {
          final matchesCity = element.city == event.city;
          final matchesCategory = state.selectedCategories.isEmpty ||
              state.selectedCategories
                  .map((e) => e.name)
                  .contains(element.categoryName);
          return matchesCity && matchesCategory;
        }).toList();

        emit(BenefitsSuccessState(
          state.benefits,
          filteredBenefits,
          state.categories,
          state.selectedCategories,
          state.cities,
          event.city,
        ));
      } catch (error) {
        emit(BenefitsFailState(
          state.benefits,
          state.filteredBenefits,
          state.categories,
          state.selectedCategories,
          state.cities,
          state.selectedCity,
        ));
      }
    });

    on<RemoveCityFilter>((event, emit) async {
      emit(BenefitsLoadingState(
        state.benefits,
        state.filteredBenefits,
        state.categories,
        state.selectedCategories,
        state.cities,
        state.selectedCity,
      ));
      try {
        List<BenefitModel> filteredBenefits = state.benefits.where((element) {
          final matchesCategory = state.selectedCategories.isEmpty ||
              state.selectedCategories
                  .map((e) => e.name)
                  .contains(element.categoryName);
          return matchesCategory;
        }).toList();

        emit(BenefitsSuccessState(
          state.benefits,
          filteredBenefits,
          state.categories,
          state.selectedCategories,
          state.cities,
          '',
        ));
      } catch (error) {
        emit(BenefitsFailState(
          state.benefits,
          state.filteredBenefits,
          state.categories,
          state.selectedCategories,
          state.cities,
          state.selectedCity,
        ));
      }
    });
  }
}
