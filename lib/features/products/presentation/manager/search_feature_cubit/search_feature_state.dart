part of 'search_feature_cubit.dart';

sealed class SearchFeatureState extends Equatable {
  const SearchFeatureState();

  @override
  List<Object> get props => [];
}

final class SearchFeatureInitial extends SearchFeatureState {}
final class SearchFeatureLoading extends SearchFeatureState {}
final class SearchFeatureLoaded extends SearchFeatureState {
  final List<ProductModel> products;
  const SearchFeatureLoaded({required this.products});
}

final class SearchFeatureError extends SearchFeatureState {
  final String message;
  const SearchFeatureError({required this.message});
}