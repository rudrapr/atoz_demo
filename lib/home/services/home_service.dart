import 'package:dio/dio.dart';
import 'package:lrnr_demo/home/models/categories_model.dart';
import 'package:lrnr_demo/home/models/listing_model.dart';

class HomeService {
  final Dio _dio = Dio();

  Future getCategories() async {
    Uri uri = Uri.parse(
        'https://atozzones.com/api/es/categories?parent=61ee35afa1ce762634d2b766&store=6135b76e5dfeaf011301827d');
    var res = await _dio.getUri(uri);
    if (res.statusCode == 200) {
      return CategoriesModel.fromJson(res.data);
    } else {
      throw Exception(res.statusMessage);
    }
  }

  Future getListings() async {
    Uri uri = Uri.parse(
        'https://atozzones.com/api/es/listings?categories=professional-services-en-en&page=1&store=6135b76e5dfeaf011301827d');
    var res = await _dio.getUri(uri);
    if (res.statusCode == 200) {
      return ListingModel.fromJson(res.data);
    } else {
      throw Exception(res.statusMessage);
    }
  }
}
