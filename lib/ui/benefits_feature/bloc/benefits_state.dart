part of 'benefits_bloc.dart';

sealed class BenefitsState extends Equatable {
  const BenefitsState(
    this.benefits,
    this.filteredBenefits,
    this.categories,
    this.selectedCategories,
    this.cities,
    this.selectedCity,
  );

  final List<BenefitModel> benefits;
  final List<BenefitModel> filteredBenefits;
  final List<FilterUiModel> categories;
  final List<FilterUiModel> selectedCategories;
  final List<FilterByCityModelResponse> cities;
  final String selectedCity;

  @override
  List<Object> get props => [];
}

final class BenefitsInitial extends BenefitsState {
  const BenefitsInitial(
      super.benefits,
      super.filteredBenefits,
      super.categories,
      super.selectedCategories,
      super.cities,
      super.selectedCity);
}

final class BenefitsSuccessState extends BenefitsState {
  const BenefitsSuccessState(
      super.benefits,
      super.filteredBenefits,
      super.categories,
      super.selectedCategories,
      super.cities,
      super.selectedCity);

  @override
  List<Object> get props => [benefits];
}

final class BenefitsFailState extends BenefitsState {
  const BenefitsFailState(
      super.benefits,
      super.filteredBenefits,
      super.categories,
      super.selectedCategories,
      super.cities,
      super.selectedCity);
}

final class BenefitsLoadingState extends BenefitsState {
  const BenefitsLoadingState(
      super.benefits,
      super.filteredBenefits,
      super.categories,
      super.selectedCategories,
      super.cities,
      super.selectedCity);
}
