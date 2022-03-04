import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lrnr_demo/home/models/categories_model.dart';
import 'package:lrnr_demo/home/models/listing_model.dart';
import 'package:lrnr_demo/home/services/home_service.dart';
import 'package:lrnr_demo/home/widgets/categories_item.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService = HomeService();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is HomeInit) {
        try {
          var categories = await _homeService.getCategories();
          var listings = await _homeService.getListings();
          emit(
              HomeSuccess(categoriesModel: categories, listingModel: listings));
        } on Exception catch (e) {
          emit(HomeFailure(message: e.toString()));
        }
      }
    });
  }
}
