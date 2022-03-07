import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:lrnr_demo/home/models/categories_model.dart';
import 'package:lrnr_demo/home/models/listing_model.dart';
import 'package:lrnr_demo/util/console.dart';
import 'package:lrnr_demo/util/my_exception.dart';

class HomeService {
  final Dio _dio = Dio();

  Future getCategories() async {
    try {
      Uri uri = Uri.parse(
          'https://atozzones.com/api/es/categories?parent=61ee35afa1ce762634d2b766&store=6135b76e5dfeaf011301827d');
      var res = await _dio.getUri(uri);

      return CategoriesModel.fromJson(res.data);
    } on DioError catch (e) {
      throw MyException(e.response?.data['message']);
    } catch (e) {
      throw MyException('Unknown Error');
    }
  }

  Future getListings() async {
    try {
      Uri uri = Uri.parse(
          'https://atozzones.com/api/es/listings?categories=professional-services-en-en&page=1&store=6135b76e5dfeaf011301827d');
      var res = await _dio.getUri(uri);

      return ListingModel.fromJson(res.data);
    } on DioError catch (e) {
      throw MyException(e.response?.data['message']);
    } catch (e) {
      throw MyException('Unknown Error');
    }
  }

  Future filterListings({required List<String> queries}) async {
    try {
      Uri uri = Uri.parse(
          'https://atozzones.com/api/es/listings?categories=professional-services-en-en&categories=${queries.join(',')} & Forestry/Wildlife=&page=1&store=6135b76e5dfeaf011301827d');

      Console.log(uri.toString());
      var res = await _dio.getUri(uri);
      return ListingModel.fromJson(res.data);
    } on DioError catch (e) {
      throw MyException(e.response?.data['message']);
    } catch (e) {
      throw MyException('Unknown Error');
    }
  }
}
