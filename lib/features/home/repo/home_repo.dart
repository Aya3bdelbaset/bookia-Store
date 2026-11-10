import 'package:bookia/core/networking/api_endpoint.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/home/models/books_model.dart';
import 'package:bookia/features/home/models/slider_model.dart';
import 'package:dio/dio.dart';
import 'package:bookia/core/networking/api_errorHandling.dart';

class HomeRepo {
  static Future<BooksModel?>? getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoints.bestSeller);
      if (response?.statusCode == 200) {
        BooksModel books = BooksModel.fromJson(response?.data);
        return books;
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioException(e);
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

  static Future<List<Products?>?> search(String text) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoints.search,
        queryParameters: {"name": text},
      );
      if (response?.statusCode == 200) {
        BooksModel booksModel = BooksModel.fromJson(response?.data);
        return booksModel.data?.products;
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioException(e);
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

  static Future<SliderModels?> getSliders() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoints.sliders);

      print('SLIDERS STATUS: ${response?.statusCode}');
      print('SLIDERS RESPONSE: ${response?.data}');

      if (response?.statusCode == 200 && response?.data != null) {
        return SliderModels.fromJson(Map<String, dynamic>.from(response!.data));
      }

      return null;
    } on DioException catch (e) {
      print('SLIDERS ERROR: $e');
      throw ApiErrorHandler.handleDioException(e);
    } catch (e, stackTrace) {
      print('SLIDERS ERROR: $e');
      print(stackTrace);
      throw Exception('Something went wrong. Please try again.');
    }
  }
}
