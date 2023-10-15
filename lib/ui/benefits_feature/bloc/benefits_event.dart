part of 'benefits_bloc.dart';

sealed class BenefitsEvent extends Equatable {
  const BenefitsEvent();

  @override
  List<Object> get props => [];
}

final class FetchBenefitsData extends BenefitsEvent {
  const FetchBenefitsData();
}

final class AddCategoryFilter extends BenefitsEvent {
  final FilterUiModel category;
  const AddCategoryFilter(this.category);
}

final class RemoveCategoryFilter extends BenefitsEvent {
  final FilterUiModel category;
  const RemoveCategoryFilter(this.category);
}
