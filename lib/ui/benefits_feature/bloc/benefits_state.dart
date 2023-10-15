part of 'benefits_bloc.dart';

sealed class BenefitsState extends Equatable {
  const BenefitsState(this.benefits, this.categories, this.selectedCategories);

  final List<BenefitModel> benefits;
  final List<FilterUiModel> categories;
  final List<FilterUiModel> selectedCategories;

  @override
  List<Object> get props => [];
}

final class BenefitsInitial extends BenefitsState {
  const BenefitsInitial(
      super.benefits, super.categories, super.selectedCategories);
}

final class BenefitsSuccessState extends BenefitsState {
  const BenefitsSuccessState(
      super.benefits, super.categories, super.selectedCategories);

  @override
  List<Object> get props => [benefits];
}

final class BenefitsFailState extends BenefitsState {
  const BenefitsFailState(
      super.benefits, super.categories, super.selectedCategories);
}

final class BenefitsLoadingState extends BenefitsState {
  const BenefitsLoadingState(
      super.benefits, super.categories, super.selectedCategories);
}
