import 'package:bloc/bloc.dart';
import 'package:bookia/features/book_details/repo/book_details_repo.dart';
import 'package:bookia/features/home/models/books_model.dart';
import 'package:flutter/foundation.dart';


part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  Future<void> getProductDetails(int productId) async {
    if (isClosed) return;

    emit(ProductDetailsLoading());

    try {
      final response = await ProductDetailsRepo.getProductDetails(productId);

      if (isClosed) return;

      if (response?.data != null) {
        emit(ProductDetailsSuccess(response!.data));
      } else {
        emit(ProductDetailsError('Failed to load product details'));
      }
    } catch (e) {
      if (isClosed) return;

      debugPrint('PRODUCT DETAILS CUBIT ERROR: $e');
      emit(ProductDetailsError('Something went wrong'));
    }
  }
}