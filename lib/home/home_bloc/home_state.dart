part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final CategoriesModel categoriesModel;
  final ListingModel listingModel;
  final String? message;

  HomeSuccess(
      {required this.categoriesModel,
      required this.listingModel,
      this.message});
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure({required this.message});
}
