part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInit extends HomeEvent {}

class FilterListing extends HomeEvent {
  final List<String> queries;

  FilterListing(this.queries);
}
