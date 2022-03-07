import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lrnr_demo/home/models/categories_model.dart';
import 'package:lrnr_demo/home/models/listing_model.dart';
import 'package:lrnr_demo/home/services/home_service.dart';
import 'package:lrnr_demo/home/widgets/categories_item.dart';
import 'package:lrnr_demo/util/console.dart';
import 'package:lrnr_demo/util/my_exception.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService = HomeService();

  var _categories;
  var _listings;

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is HomeInit) {
        try {
          _categories = await _homeService.getCategories();
          _listings = await _homeService.getListings();
          emit(HomeSuccess(
              categoriesModel: _categories, listingModel: _listings));
        } on MyException catch (e) {
          emit(HomeFailure(message: e.message!));
        }
      } else if (event is FilterListing) {
        try {
          _listings = await _homeService.filterListings(queries: event.queries);
          emit(HomeSuccess(
              categoriesModel: _categories, listingModel: _listings));
        } on MyException catch (e) {
          emit(HomeSuccess(
              categoriesModel: _categories,
              listingModel: _listings,
              message: e.message!));
        }
      }
    });
  }
}
